# 本地发版打包命令集合

versionName=$1
versionCode=$2

projectPath=$(dirname "$PWD")

cd $projectPath
apkName=pt_${versionName}_64.apk
python3 packageGP.py $versionCode "$versionName" "64"
cp $projectPath/build/app/outputs/apk/banban_locale/release/app-banban_locale-release.apk $projectPath/package_app/$apkName
cd package_app
python3 changeChannelList.py $apkName '64'

sleep 2

cd $projectPath
apkName=pt_${versionName}_32+64.apk
python3 packageGP.py $versionCode "$versionName" "32+64"
cp $projectPath/build/app/outputs/apk/banban_locale/release/app-banban_locale-release.apk $projectPath/package_app/$apkName
cd package_app
python3 changeChannelList.py $apkName '32+64'

sleep 2

cd $projectPath
python3 packageGP.py $versionCode "$versionName" "aab"
cp $projectPath/build/app/outputs/bundle/banban_localeRelease/app-banban_locale-release.aab $projectPath/package_app/pt_${versionName}.aab

sleep 2

# 构建 iOS
cd $projectPath/ci
./build_ipa_223.sh "store" "$versionName" 1 "disable" "Bug fixes and optimizations." 1
sleep 2
./build_ipa_223.sh "store" "$versionName" 99 "disable" "Bug fixes and optimizations." 1