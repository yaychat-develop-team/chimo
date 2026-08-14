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

require_plist() {
    local plist=$1
    if [ ! -f "$plist" ]; then
        echo "ERROR: export options plist missing: $plist" >&2
        exit 1
    fi
}

# flutter build ipa 已导出 IPA 时跳过二次 export；否则用 xcodebuild 补导出
export_archive_if_needed() {
    local exportPlist=$1
    require_plist "$exportPlist"
    local existing
    existing=$(find "$projectPath/build/ios/ipa" -name "*.ipa" 2>/dev/null | head -n 1 || true)
    if [ -n "$existing" ]; then
        echo "IPA already present, skip xcodebuild export: $existing"
        return 0
    fi
    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    if [ ! -d "$archivePath" ]; then
        echo "ERROR: archive not found: $archivePath" >&2
        exit 1
    fi
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') 开始 export"
    xcodebuild -exportArchive \
        -archivePath "$archivePath" \
        -exportPath "$projectPath/build/ios/ipa/" \
        -exportOptionsPlist "$exportPlist" \
        -allowProvisioningUpdates \
        -authenticationKeyID "$apiKey" \
        -authenticationKeyIssuerID "$apiIssuer"
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') export 命令结束"
}

function buildStore() {
    cd "$projectPath"

    local ipaPath="$projectPath/build/ios/ipa/Partying.ipa"
    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    local buildOutputPath="$projectPath/package_app"

    require_plist "$storePlist"
    flutter build ipa --release \
        --build-number "$versionCode" \
        --build-name "$versionName" \
        --export-options-plist="$storePlist"
    export_archive_if_needed "$storePlist"

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

# 清理缓存后重装 Pods，避免 Info.plist / 签名变更被旧 DerivedData 卡住
echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') clean caches"
flutter clean
rm -rf "$projectPath/ios/Pods" "$projectPath/ios/Podfile.lock"
rm -rf "$HOME/Library/Developer/Xcode/DerivedData"
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

if [ "$buildType" == "debug" ] || [ "$buildType" == "profile" ]; then
    if [ -d "$projectPath/build/ios" ]; then
        rm -rf "$projectPath/build/ios"
    fi
    if [[ "$debugModel" == "enable" ]]; then
        flutter build ipa --profile \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=true \
            --dart-define=CI_NUM="$ciNum" \
            --export-options-plist="$adhocPlist" \
            -v
    else
        flutter build ipa --profile \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=false \
            --export-options-plist="$adhocPlist" \
            -v
    fi
    export_archive_if_needed "$adhocPlist"

elif [ "$buildType" == "release" ]; then
    if [ -d "$projectPath/build/ios" ]; then
        rm -rf "$projectPath/build/ios"
    fi

    if [[ "$debugModel" == "enable" ]]; then
        flutter build ipa --release \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=true \
            --dart-define=CI_NUM="$ciNum" \
            --export-options-plist="$adhocPlist" \
            -v
    else
        flutter build ipa --release \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=false \
            --export-options-plist="$adhocPlist" \
            -v
    fi
    export_archive_if_needed "$adhocPlist"
elif [ "$buildType" == "store" ]; then
    buildStore
else
    echo "ERROR: unknown buildType=$buildType" >&2
    exit 1
fi
