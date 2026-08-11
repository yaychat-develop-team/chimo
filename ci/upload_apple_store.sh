#!/bin/bash
export LANG=en_US.UTF-8

apiKey="${APP_STORE_API_KEY:-}"
apiIssuer="${APP_STORE_API_ISSUER:-}"
if [ -z "$apiKey" ] || [ -z "$apiIssuer" ]; then
    echo "ERROR: APP_STORE_API_KEY / APP_STORE_API_ISSUER is not set" >&2
    exit 1
fi
versionName=$1
versionNumber=$2
projectPath="$(dirname "$(dirname "$0")")"
echo "$projectPath"
cd "$projectPath"
cd ios
flutter clean
flutter pub get
pod install
chmod +x *.sh

ipaPath="$projectPath/build/ios/ipa/chimo.ipa"
exportOptions="$projectPath/ios/ExportOptions.plist"
if [ -f "$ipaPath" ]; then
  echo "Found ipa file at $ipaPath, deleting..."
  rm -f "$ipaPath"
fi

echo "$ipaPath"
#flutter build ipa --release --export-options-plist $exportOptions --obfuscate --split-debug-info build/symbols/$versionName/ --build-name $versionName -v
flutter build ipa --release --export-options-plist $exportOptions --build-name $versionName --build-number $versionNumber -v
xcrun altool --upload-app --type ios -f $ipaPath --apiKey "$apiKey" --apiIssuer "$apiIssuer"
