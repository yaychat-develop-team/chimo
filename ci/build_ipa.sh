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
unlock_signing_keychain() {
    local kc="${KEYCHAIN_PATH:-$HOME/Library/Keychains/login.keychain-db}"
    if [ ! -f "$kc" ] && [ -f "$HOME/Library/Keychains/login.keychain" ]; then
        kc="$HOME/Library/Keychains/login.keychain"
    fi
    local pw="${KEYCHAIN_PASSWORD:-}"
    echo "[DEBUG] unlock keychain: $kc"
    if [ -n "$pw" ]; then
        security unlock-keychain -p "$pw" "$kc" || true
        # 允许 codesign 在无 UI 下使用私钥（否则仍可能 errSecInternalComponent）
        security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k "$pw" "$kc" >/dev/null 2>&1 || true
        security set-keychain-settings -t 21600 -u "$kc" >/dev/null 2>&1 || true
    else
        # 已登录会话偶发可直接 unlock；失败只告警
        security unlock-keychain "$kc" 2>/dev/null || \
            echo "WARN: KEYCHAIN_PASSWORD unset; if codesign fails with errSecInternalComponent, set it in ci.env" >&2
    fi
    security list-keychains -d user -s "$kc" >/dev/null 2>&1 || true
    security default-keychain -d user -s "$kc" >/dev/null 2>&1 || true
    security find-identity -v -p codesigning 2>/dev/null | head -n 20 || true
}

# IPA 归档必须用 Release：Profile 会触发
# “Flutter archive not built in Release mode”，且 xcode_backend 签名易失败。
# 测试服/正式服由 --dart-define=DEBUG_MODE 控制，不靠 Profile。
# 流程：flutter build ios → xcodebuild archive(API Key) → export(API Key)
build_archive() {
    local extra=()
    local arg
    for arg in "$@"; do
        case "$arg" in
            --release|--profile)
                # 忽略调用方 mode；统一 Release 归档
                ;;
            *)
                extra+=("$arg")
                ;;
        esac
    done

    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    local workspace="$projectPath/ios/Runner.xcworkspace"
    rm -rf "$archivePath"

    unlock_signing_keychain

    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') flutter build ios --release"
    flutter build ios --release "${extra[@]}"

    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') xcodebuild archive (Release) with API key"
    xcodebuild archive \
        -workspace "$workspace" \
        -scheme Runner \
        -configuration Release \
        -destination 'generic/platform=iOS' \
        -archivePath "$archivePath" \
        -allowProvisioningUpdates \
        -authenticationKeyID "$apiKey" \
        -authenticationKeyIssuerID "$apiIssuer" \
        -authenticationKeyPath "$authKeyPath" \
        DEVELOPMENT_TEAM=7FB5L562F4

    if [ ! -d "$archivePath" ]; then
        echo "ERROR: xcodebuild archive produced no archive at $archivePath" >&2
        exit 1
    fi
    echo "[DEBUG] archive ok: $archivePath"
    rm -f "$projectPath/build/ios/ipa/"*.ipa 2>/dev/null || true
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
  if command -v arch >/dev/null 2>&1; then
    arch -x86_64 pod install --repo-update || pod install --repo-update
  else
    pod install --repo-update
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
