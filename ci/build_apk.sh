#!/usr/bin/env bash
buildType=$1
versionName=$2
versionCode=$3
debugModel=$4
ciNum=$5
abis=$6

projectPath=$(dirname "$PWD")

targetPlatform="android-arm"

if [ $abis == "armeabi-v7a,arm64-v8a" ]; then
  targetPlatform="android-arm,android-arm64"
elif [ $abis == 'arm64-v8a' ]; then
  targetPlatform="android-arm64"
fi

echo "targetPlatform=" $targetPlatform

if [ $buildType == "debug" ]; then
    apkPath="$projectPath/build/app/outputs/flutter-apk/app-debug.apk"
    if [ -d "$projectPath/build/app/outputs" ]; then
        rm -rf $projectPath/build/app/outputs
    fi
#    cur_timestamp=$(date +%s)
    flutter build apk --debug --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" --dart-define=ABI_FILTERS=$abis --target-platform=$targetPlatform -v

    mv $apkPath $projectPath/build/app/outputs/apk/yqdf_${buildType}_${ciNum}.apk
    cp $projectPath/build/app/outputs/apk/yqdf_${buildType}_${ciNum}.apk $projectPath/apks/yaychat_${buildType}_${ciNum}.apk
elif [ $buildType == "profile" ]; then
         apkPath="$projectPath/build/app/outputs/flutter-apk/app-profile.apk"
         if [ -d "$projectPath/build/app/outputs" ]; then
             rm -rf $projectPath/build/app/outputs
         fi
         cur_timestamp=$(date +%s)
         flutter build apk --profile --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" --dart-define=ABI_FILTERS=$abis --target-platform=$targetPlatform -v

         mv $apkPath $projectPath/build/app/outputs/apk/yqdf_${buildType}_${ciNum}.apk
         cp $projectPath/build/app/outputs/apk/yqdf_${buildType}_${ciNum}.apk $projectPath/apks/yaychat_${buildType}_${ciNum}.apk
elif [ $buildType == "release" ]; then
    apkPath="$projectPath/build/app/outputs/flutter-apk/app-release.apk"
    if [ -d "$projectPath/build/app/outputs" ]; then
        rm -rf $projectPath/build/app/outputs
    fi
    if [[ "$debugModel" == "enable" ]]; then
        cur_timestamp=$(date +%s)
        flutter build apk --release --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" --dart-define=ABI_FILTERS=$abis --target-platform=$targetPlatform -v
    else
        flutter clean
        flutter build apk --release --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=false --dart-define=ABI_FILTERS=$abis --target-platform=$targetPlatform -v
    fi
    mv $apkPath $projectPath/build/app/outputs/apk/yqdf_${buildType}_${ciNum}.apk
    cp $projectPath/build/app/outputs/apk/yqdf_${buildType}_${ciNum}.apk $projectPath/apks/yaychat_${buildType}_${ciNum}.apk
elif [ $buildType == "store" ]; then
    echo 'store build'
fi
