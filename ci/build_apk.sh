#!/usr/bin/env bash
set -euo pipefail

buildType=${1:?missing buildType}
versionName=${2:?missing versionName}
versionCode=${3:?missing versionCode}
debugModel=${4:-disable}
ciNum=${5:?missing ciNum}
# Jenkins 未传 ABIS 时，未加引号的空 $abis 会丢参；默认 arm64-v8a
abis=${6:-arm64-v8a}

projectPath=$(dirname "$PWD")

# 国内 Flutter 存储镜像偶发返回 HTML，导致 profile/release 引擎 POM 解析失败
if [ -z "${FLUTTER_STORAGE_BASE_URL:-}" ]; then
  export FLUTTER_STORAGE_BASE_URL="https://storage.googleapis.com"
fi

targetPlatform="android-arm"

if [ "$abis" == "armeabi-v7a,arm64-v8a" ]; then
  targetPlatform="android-arm,android-arm64"
elif [ "$abis" == 'arm64-v8a' ]; then
  targetPlatform="android-arm64"
fi

echo "targetPlatform=" "$targetPlatform"
echo "FLUTTER_STORAGE_BASE_URL=" "$FLUTTER_STORAGE_BASE_URL"

finish_apk() {
  local src=$1
  local outName="chimo_${buildType}_${ciNum}.apk"
  if [ ! -f "$src" ]; then
    echo "ERROR: APK not found after build: $src" >&2
    exit 1
  fi
  mkdir -p "$projectPath/build/app/outputs/apk" "$projectPath/apks"
  mv "$src" "$projectPath/build/app/outputs/apk/$outName"
  cp "$projectPath/build/app/outputs/apk/$outName" "$projectPath/apks/$outName"
  echo "OK: $projectPath/apks/$outName"
}

if [ "$buildType" == "debug" ]; then
    apkPath="$projectPath/build/app/outputs/flutter-apk/app-debug.apk"
    if [ -d "$projectPath/build/app/outputs" ]; then
        rm -rf "$projectPath/build/app/outputs"
    fi
    flutter build apk --debug --build-number "$versionCode" --build-name "$versionName" --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" --dart-define=ABI_FILTERS="$abis" --target-platform="$targetPlatform" -v
    finish_apk "$apkPath"
elif [ "$buildType" == "profile" ]; then
    apkPath="$projectPath/build/app/outputs/flutter-apk/app-profile.apk"
    if [ -d "$projectPath/build/app/outputs" ]; then
        rm -rf "$projectPath/build/app/outputs"
    fi
    flutter build apk --profile --build-number "$versionCode" --build-name "$versionName" --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" --dart-define=ABI_FILTERS="$abis" --target-platform="$targetPlatform" -v
    finish_apk "$apkPath"
elif [ "$buildType" == "release" ]; then
    apkPath="$projectPath/build/app/outputs/flutter-apk/app-release.apk"
    if [ -d "$projectPath/build/app/outputs" ]; then
        rm -rf "$projectPath/build/app/outputs"
    fi
    if [[ "$debugModel" == "enable" ]]; then
        flutter build apk --release --build-number "$versionCode" --build-name "$versionName" --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" --dart-define=ABI_FILTERS="$abis" --target-platform="$targetPlatform" -v
    else
        flutter clean
        flutter build apk --release --build-number "$versionCode" --build-name "$versionName" --dart-define=DEBUG_MODE=false --dart-define=ABI_FILTERS="$abis" --target-platform="$targetPlatform" -v
    fi
    finish_apk "$apkPath"
elif [ "$buildType" == "store" ]; then
    echo 'store build'
else
    echo "ERROR: unknown buildType=$buildType" >&2
    exit 1
fi
