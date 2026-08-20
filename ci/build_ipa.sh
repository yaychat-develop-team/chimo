#!/usr/bin/env bash
# 对齐 joyride_flutter/ci/build_ipa.sh 的打包流程：
# flutter build ipa → xcodebuild -exportArchive
# App Store API Key / Issuer 从环境变量读取（不写死在脚本里）。
set -e

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

# 与 joyride 相同 Key，优先环境变量 / ci.env
apiKey="${APP_STORE_API_KEY:-L234X7R275}"
apiIssuer="${APP_STORE_API_ISSUER:-e0eabb11-fcfd-43d1-8e83-21f3ce4995eb}"

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
export_auth_args=()
if [ -n "$authKeyPath" ]; then
    echo "Using App Store Connect API key file: $authKeyPath"
    export_auth_args=(
        -authenticationKeyID "$apiKey"
        -authenticationKeyIssuerID "$apiIssuer"
        -authenticationKeyPath "$authKeyPath"
    )
else
    # 对齐 joyride：没有显式 .p8 路径时仍传 Key ID / Issuer（依赖本机默认目录）
    echo "WARN: AuthKey_${apiKey}.p8 not found via APP_STORE_API_KEY_PATH; using Key ID/Issuer only"
    export_auth_args=(
        -authenticationKeyID "$apiKey"
        -authenticationKeyIssuerID "$apiIssuer"
    )
fi

function buildStore() {
    cd "$projectPath"
    flutter pub get
    cd ios
    if command -v arch >/dev/null 2>&1; then
        arch -x86_64 pod install --repo-update || pod install --repo-update
    else
        pod install --repo-update
    fi

    cd "$projectPath"

    local ipaPath="$projectPath/build/ios/ipa/Partying.ipa"
    local archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    local buildOutputPath="$projectPath/package_app"

    flutter build ipa --release --build-number "$versionCode" --build-name "$versionName"
    xcodebuild -exportArchive \
        -archivePath "$archivePath" \
        -exportPath "$projectPath/build/ios/ipa/" \
        -exportOptionsPlist "$storePlist" \
        -allowProvisioningUpdates \
        "${export_auth_args[@]}"

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
            -v
    else
        flutter build ipa --profile \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=false \
            -v
    fi
    archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') 开始 export"
    xcodebuild -exportArchive \
        -archivePath "$archivePath" \
        -exportPath "$projectPath/build/ios/ipa/" \
        -exportOptionsPlist "$adhocPlist" \
        -allowProvisioningUpdates \
        "${export_auth_args[@]}"
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') export 命令结束"

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
            -v
    else
        flutter build ipa --release \
            --build-number "$versionCode" \
            --build-name "$versionName" \
            --dart-define=DEBUG_MODE=false \
            -v
    fi
    archivePath="$projectPath/build/ios/archive/Runner.xcarchive"
    xcodebuild -exportArchive \
        -archivePath "$archivePath" \
        -exportPath "$projectPath/build/ios/ipa/" \
        -exportOptionsPlist "$adhocPlist" \
        -allowProvisioningUpdates \
        "${export_auth_args[@]}"

elif [ "$buildType" == "store" ]; then
    buildStore
else
    echo "ERROR: unknown buildType=$buildType" >&2
    exit 1
fi
