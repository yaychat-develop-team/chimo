#!/usr/bin/env bash
set -euo pipefail

# shellcheck source=load_ci_env.sh
source "$(dirname "$0")/load_ci_env.sh"
# shellcheck source=ios_uploader.sh
source "$(dirname "$0")/ios_uploader.sh"

buildType=$1
versionName=$2
versionCode=$3
debugModel=$4
releaseNotes=$5
ciNum=$6

projectPath=$(dirname "$PWD")
adhocPlist="$projectPath/ios/export_adhoc.plist"
storePlist="$projectPath/ios/ExportOptions.plist"

apiKey="${APP_STORE_API_KEY:-}"
apiIssuer="${APP_STORE_API_ISSUER:-}"
if [ -z "$apiKey" ] || [ -z "$apiIssuer" ]; then
    echo "ERROR: APP_STORE_API_KEY / APP_STORE_API_ISSUER is not set (needed for xcodebuild -exportArchive)." >&2
    echo "Configure Jenkins credentials or create ci/ci.env from ci/ci.env.example." >&2
    exit 1
fi

resolve_auth_key_path() {
    local explicit="${APP_STORE_API_KEY_PATH:-}"
    if [ -n "$explicit" ] && [ -f "$explicit" ]; then
        echo "$explicit"
        return 0
    fi
    local name="AuthKey_${apiKey}.p8"
    local candidate
    for candidate in \
        "$HOME/.appstoreconnect/private_keys/$name" \
        "$HOME/private_keys/$name" \
        "$HOME/.private_keys/$name" \
        "$projectPath/private_keys/$name"
    do
        if [ -f "$candidate" ]; then
            echo "$candidate"
            return 0
        fi
    done
    return 1
}

authKeyPath="$(resolve_auth_key_path || true)"
if [ -z "$authKeyPath" ]; then
    echo "ERROR: App Store Connect .p8 not found (AuthKey_${apiKey}.p8)." >&2
    echo "Put it at ~/.appstoreconnect/private_keys/ or set APP_STORE_API_KEY_PATH." >&2
    echo "Without it, xcodebuild falls back to Xcode Apple ID (giant@… Xcode-Token) and export fails." >&2
    exit 1
fi
echo "Using App Store Connect API key file: $authKeyPath"

require_plist() {
    local plist=$1
    if [ ! -f "$plist" ]; then
        echo "ERROR: export options plist missing: $plist" >&2
        exit 1
    fi
}

# Jenkins 无 GUI 时常锁住 login keychain → codesign 报 errSecInternalComponent。
# 兼容多种环境变量名；有密码则主动解锁并放开 codesign 分区。
# 对齐 joyride：签名前先解锁，再用 flutter build ipa（同一台机以前能过的路径）。
unlock_signing_keychain() {
    local kc="${KEYCHAIN_PATH:-$HOME/Library/Keychains/login.keychain-db}"
    if [ ! -f "$kc" ] && [ -f "$HOME/Library/Keychains/login.keychain" ]; then
        kc="$HOME/Library/Keychains/login.keychain"
    fi
    # 兼容 Jenkins 凭据里常见命名
    local pw="${KEYCHAIN_PASSWORD:-${LOGIN_PASSWORD:-${MAC_PASSWORD:-${KEYCHAIN_PASS:-}}}}"
    echo "[DEBUG] unlock keychain: $kc"
    if [ ! -f "$kc" ]; then
        echo "WARN: signing keychain not found: $kc" >&2
        return 0
    fi
    if [ -n "$pw" ]; then
        export KEYCHAIN_PASSWORD="$pw"
        security unlock-keychain -p "$pw" "$kc" || \
            echo "WARN: failed to unlock keychain with password" >&2
        security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k "$pw" "$kc" >/dev/null 2>&1 || \
            echo "WARN: set-key-partition-list failed for $kc" >&2
        security set-keychain-settings -t 21600 -u "$kc" >/dev/null 2>&1 || true
        echo "[DEBUG] keychain unlock attempted with password env"
    else
        if security unlock-keychain "$kc" 2>/dev/null; then
            echo "[DEBUG] keychain unlocked without password (session already unlocked)"
        else
            echo "WARN: KEYCHAIN_PASSWORD unset and keychain is locked." >&2
            echo "WARN: iOS codesign will likely fail with errSecInternalComponent." >&2
            echo "WARN: Ask Mac admin to set Jenkins env KEYCHAIN_PASSWORD = macOS login password for user doufeng." >&2
        fi
    fi
    security list-keychains -d user -s "$kc" >/dev/null 2>&1 || true
    security default-keychain -d user -s "$kc" >/dev/null 2>&1 || true
    security find-identity -v -p codesigning "$kc" 2>/dev/null | head -n 20 || true
}

print_codesign_help() {
    cat >&2 <<'EOF'
ERROR: iOS codesign failed (errSecInternalComponent).
This is NOT caused by app feature code. The Jenkins Mac keychain is locked / private key inaccessible.

Fix on the packaging Mac (user: doufeng), once:
  1) Jenkins Job → Configure → Environment / Credentials Bindings
     add: KEYCHAIN_PASSWORD = that Mac login password
  2) Or create /Users/doufeng/.jenkins/chimo-ci.env with:
       KEYCHAIN_PASSWORD=...
  3) Or SSH/login to the Mac GUI once and unlock Keychain Access.

Then rebuild. App runtime (test/prod) is unaffected.
EOF
}

# IPA：对齐 joyride，优先 flutter build ipa；失败时打印签名指引。
# 测试服/正式服由 --dart-define=DEBUG_MODE 控制。
build_archive() {
    local extra=()
    local arg
    for arg in "$@"; do
        case "$arg" in
            --release|--profile)
                ;;
            *)
                extra+=("$arg")
                ;;
        esac
    done

    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    rm -rf "$archivePath"
    rm -f "$projectPath/build/ios/ipa/"*.ipa 2>/dev/null || true

    # 必须在任何 codesign 之前解锁（flutter build ipa 会签名）
    unlock_signing_keychain

    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') flutter build ipa --release (joyride-compatible)"
    set +e
    # 不在这里 export；统一由后续 export_archive 用 adhoc/store plist 导出
    flutter build ipa --release "${extra[@]}"
    local flutter_rc=$?
    set -e
    if [ "$flutter_rc" -ne 0 ]; then
        if [ ! -d "$archivePath" ]; then
            print_codesign_help
            exit "$flutter_rc"
        fi
        echo "WARN: flutter build ipa returned $flutter_rc but archive exists; continue export" >&2
    fi

    if [ ! -d "$archivePath" ]; then
        # 回退：旧路径 flutter build ios --no-codesign + xcodebuild archive
        echo "[WARN] archive missing after flutter build ipa; fallback to xcodebuild archive"
        unlock_signing_keychain
        set +e
        flutter build ios --release --no-codesign "${extra[@]}"
        xcodebuild archive \
            -workspace "$projectPath/ios/Runner.xcworkspace" \
            -scheme Runner \
            -configuration Release \
            -destination 'generic/platform=iOS' \
            -archivePath "$archivePath" \
            -allowProvisioningUpdates \
            -authenticationKeyID "$apiKey" \
            -authenticationKeyIssuerID "$apiIssuer" \
            -authenticationKeyPath "$authKeyPath" \
            DEVELOPMENT_TEAM=7FB5L562F4
        local archive_rc=$?
        set -e
        if [ "$archive_rc" -ne 0 ] || [ ! -d "$archivePath" ]; then
            print_codesign_help
            exit "${archive_rc:-1}"
        fi
    fi
    echo "[DEBUG] archive ok: $archivePath"
}

export_archive() {
    local exportPlist=$1
    require_plist "$exportPlist"
    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    if [ ! -d "$archivePath" ]; then
        echo "ERROR: archive not found: $archivePath" >&2
        exit 1
    fi
    mkdir -p "$projectPath/build/ios/ipa"
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') 开始 export"
    xcodebuild -exportArchive \
        -archivePath "$archivePath" \
        -exportPath "$projectPath/build/ios/ipa/" \
        -exportOptionsPlist "$exportPlist" \
        -allowProvisioningUpdates \
        -authenticationKeyID "$apiKey" \
        -authenticationKeyIssuerID "$apiIssuer" \
        -authenticationKeyPath "$authKeyPath"
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') export 命令结束"
}

function buildStore() {
    cd "$projectPath"

    local ipaPath="$projectPath/build/ios/ipa/Partying.ipa"
    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    local buildOutputPath="$projectPath/package_app"

    require_plist "$storePlist"
    build_archive --release \
        --build-number "$versionCode" \
        --build-name "$versionName"
    export_archive "$storePlist"

    if [ -f "$ipaPath" ]; then
        local targetPath="$buildOutputPath/$versionName-$buildType-$versionCode.ipa"
        mkdir -p "$buildOutputPath"
        mv "$ipaPath" "$targetPath"
    fi

    if [ "$versionCode" == 1 ]; then
       cd "$projectPath/ios"
       fastlane ios submit versionName:"$versionName" buildNum:"$versionCode" ipa:"$ipaPath"
    fi

    local uploadymbolsPath="$projectPath/ios/Pods/FirebaseCrashlytics/upload-symbols"
    local plistPath="$projectPath/ios/Runner/GoogleService-Info.plist"
    local dsymPath="$projectPath/build/ios/archive/Runner.xcarchive/dSYMs/"
    if [ -d "$dsymPath" ] && [ -x "$uploadymbolsPath" ]; then
      "$uploadymbolsPath" -gsp "$plistPath" -p ios "$dsymPath"
    fi
}

cd "$projectPath"
require_plist "$adhocPlist"

# 清理本工程缓存后重装 Pods（不要清空整机 DerivedData，会拖垮同机其它任务）
echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') clean caches"
flutter clean
rm -rf "$projectPath/ios/Pods" "$projectPath/ios/Podfile.lock"
rm -rf "$HOME/Library/Developer/Xcode/DerivedData"/Runner-* \
       "$HOME/Library/Developer/Xcode/DerivedData"/chimo-* 2>/dev/null || true
flutter pub get
echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') pod install"
(
  cd "$projectPath/ios"
  echo "[DEBUG] build host: $(uname -m 2>/dev/null || echo unknown)"
  echo "[DEBUG] ruby version: $(ruby -v 2>/dev/null || echo unknown)"
  echo "[DEBUG] cocoapods version: $(pod --version 2>/dev/null || echo unknown)"

  # 兼容 Apple Silicon / Intel 在不同 Ruby/gems 架构下经常出现的：
  #   LoadError: ... ffi ... (mach-o file, but is an incompatible architecture ...)
  # 这里策略：先原生 pod install；失败后重装 ffi（对应当前架构），再重试一次；
  # 若仍失败且存在 arch，则用 x86_64 版本再重装 ffi 并重试。
  pod_install() {
    pod install --repo-update
  }

  reinstall_ffi_native() {
    gem uninstall -aIx ffi >/dev/null 2>&1 || true
    gem install ffi -v 1.15.5 --no-document >/dev/null 2>&1 || gem install ffi --no-document >/dev/null 2>&1 || true
  }

  reinstall_ffi_x86() {
    arch -x86_64 gem uninstall -aIx ffi >/dev/null 2>&1 || true
    arch -x86_64 gem install ffi -v 1.15.5 --no-document >/dev/null 2>&1 || arch -x86_64 gem install ffi --no-document >/dev/null 2>&1 || true
  }

  ensure_ffi_for_ruby() {
    if ruby -e "require 'ffi'" >/dev/null 2>&1; then
      return 0
    fi
    local ruby_arch
    ruby_arch="$(ruby -e 'print RUBY_PLATFORM' 2>/dev/null || echo unknown)"
    echo "[WARN] ffi not loadable for ruby ($ruby_arch); reinstalling matching ffi"
    if printf '%s' "$ruby_arch" | grep -q 'x86_64'; then
      reinstall_ffi_x86
    else
      reinstall_ffi_native
    fi
  }

  ensure_ffi_for_ruby

  if ! pod_install; then
    echo "[WARN] pod install failed on native arch; retry after reinstalling ffi (native)"
    reinstall_ffi_native
    pod_install || {
      if command -v arch >/dev/null 2>&1; then
        echo "[WARN] retry pod install with arch -x86_64 after reinstalling ffi (x86_64)"
        reinstall_ffi_x86
        arch -x86_64 pod install --repo-update
      else
        exit 1
      fi
    }
  fi
)

if [ "$buildType" == "debug" ] || [ "$buildType" == "profile" ] || [ "$buildType" == "release" ]; then
    if [ -d "$projectPath/build/ios" ]; then
        rm -rf "$projectPath/build/ios"
    fi
    # debug/profile/release 统一 Release 出 IPA；环境靠 DEBUG_MODE。
    if [[ "$debugModel" == "enable" ]]; then
        build_archive --release \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=true \
            --dart-define=CI_NUM="$ciNum" \
            -v
    else
        build_archive --release \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=false \
            -v
    fi
    export_archive "$adhocPlist"
elif [ "$buildType" == "store" ]; then
    buildStore
else
    echo "ERROR: unknown buildType=$buildType" >&2
    exit 1
fi
