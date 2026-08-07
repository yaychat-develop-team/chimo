#!/usr/bin/env bash
set -e
source ios_uploader.sh

buildType=$1
versionName=$2
versionCode=$3
debugModel=$4
releaseNotes=$5
ciNum=$6

projectPath=$(dirname "$PWD")

apiKey="${APP_STORE_API_KEY:?APP_STORE_API_KEY is not set}"
apiIssuer="${APP_STORE_API_ISSUER:?APP_STORE_API_ISSUER is not set}"

function buildStore() {
    cd $projectPath
    flutter pub get
    cd ios
    arch -x86_64 pod install --repo-update

    cd $projectPath

    ipaPath=$projectPath/build/ios/ipa/Partying.ipa
    archivePath=$projectPath/build/ios/archive/Runner.xcarchive
    buildOutputPath=$projectPath/package_app
    
    flutter build ipa --release --build-number $versionCode --build-name $versionName
    xcodebuild -exportArchive -archivePath $archivePath -exportPath build/ios/ipa/ -exportOptionsPlist ios/ExportOptions.plist -allowProvisioningUpdates -authenticationKeyID "$apiKey" -authenticationKeyIssuerID "$apiIssuer"

    if [ -f "$ipaPath" ]; then
        targetPath="$buildOutputPath/$versionName-$buildType-$versionCode.ipa"
        mv "$ipaPath" $targetPath
    fi

#     cd $projectPath/ci/upload_gp
#     python3 translate_ios_releasenotes.py "$releaseNotes" $projectPath/ios/fastlane/metadata

    if [ $versionCode == 1 ];then
       cd $projectPath/ios
       fastlane ios submit versionName:$versionName buildNum:$versionCode ipa:$ipaPath
    fi

    # upload dSYM
    uploadymbolsPath=$projectPath/ios/Pods/FirebaseCrashlytics/upload-symbols
    plistPath=$projectPath/ios/Runner/GoogleService-Info.plist
    dsymPath=$projectPath/build/ios/archive/Runner.xcarchive/dSYMs/
    if [ -d "$dsymPath" ];then
      $uploadymbolsPath -gsp $plistPath -p ios $dsymPath
    fi
}

cd $projectPath

if [ "$buildType" == "debug" ] || [ "$buildType" == "profile" ]; then
    ipaPath=$(find "$projectPath/build/ios/ipa/" -name "*.ipa")
    if [ -d "$projectPath/build/ios" ]; then
        rm -rf $projectPath/build/ios
    fi
    if [[ "$debugModel" == "enable" ]]; then
        flutter build ipa --profile --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" -v
    else
        flutter build ipa --profile --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=false -v
    fi
    archivePath=$projectPath/build/ios/archive/Runner.xcarchive
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') 开始 export"
    xcodebuild -exportArchive -archivePath $archivePath -exportPath build/ios/ipa/ -exportOptionsPlist ios/export_adhoc.plist -allowProvisioningUpdates -authenticationKeyID "$apiKey" -authenticationKeyIssuerID "$apiIssuer"
    echo "[DEBUG] $(date '+%Y-%m-%d %H:%M:%S') export 命令结束"

elif [ $buildType == "release" ]; then
    ipaPath=$(find "$projectPath/build/ios/ipa/" -name "*.ipa")
    if [ -d "$projectPath/build/ios" ]; then
        rm -rf $projectPath/build/ios
    fi

    if [[ "$debugModel" == "enable" ]]; then
        flutter build ipa --release --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=true --dart-define=CI_NUM="$ciNum" -v
    else
        flutter build ipa --release --build-number $versionCode --build-name $versionName --dart-define=DEBUG_MODE=false -v
    fi
    archivePath=$projectPath/build/ios/archive/Runner.xcarchive
    xcodebuild -exportArchive -archivePath $archivePath -exportPath build/ios/ipa/ -exportOptionsPlist ios/export_adhoc.plist -allowProvisioningUpdates -authenticationKeyID "$apiKey" -authenticationKeyIssuerID "$apiIssuer"
else
    echo "buildStore"
fi
