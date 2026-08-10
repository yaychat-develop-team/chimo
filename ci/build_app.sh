#!/usr/bin/env bash
appName=$1
buildPlatform=$2
buildType=$3
versionName=$4
versionCode=$5
debugModel=$6
ciNum=$7
buildUser=$8
buildBranch=$9
abis=${10}


function currentTimeStamp(){
    cs=`date '+%s'`
    cms=`expr $cs \* 1000`
}

projectPath=$(dirname "$PWD")

last_build_info="$projectPath/ci/build/last_build.txt"
last_commit_id="$projectPath/ci/build/last_commit_id.txt"
build_branch_name="${buildBranch//\//_}"
last_branch_commit_id="$projectPath/ci/build/${build_branch_name}_commit_id.txt"
if [ ! -d "$projectPath/ci/build/" ]; then
    mkdir $projectPath/ci/build
fi
mkdir -p "$projectPath/build/ios/ipa/"

echo "" >$last_commit_id

build_info="version: $versionName"

# save last_base_commit of submodule b
last_commit=$(git log -1 --pretty=%h)
# save the last commit for rollback
echo "$last_commit" >$last_commit_id

if [ -f "$last_branch_commit_id" ]; then
    last_commit="$(cat $last_branch_commit_id)"
fi

# send success msg to wecom
python3 wechat_notify.py 0 "Start Building $ciNum 号包..." "" "" "" "" $ciNum "$buildUser" "$buildBranch"

lastest_commit=$(git log -1 --pretty=%h)
CHANGE_LOG=$(git shortlog --pretty=format:"- **%s** %ar" $last_commit..$lastest_commit)

apkPath="$projectPath/build/app/outputs/apk/chimo_${buildType}_${ciNum}.apk"
if [ $buildPlatform == 'Android' ]; then
    ./build_apk.sh $buildType $versionName $versionCode $debugModel $ciNum $abis
    if [ $buildType == 'store' ];then
        bundlePath="$projectPath/build/app/outputs/bundle/chimo_$versionName.aab"
        if [[ ! -f $bundlePath ]]; then
            msg="**Android 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
            python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
            exit 1
        fi
    elif [[ ! -f $apkPath ]]; then
        msg="**Android 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
        python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
        exit 1
    fi

    if [ -f "$apkPath" ]; then
        python3 upload_r2.py --file $apkPath --app_name $appName --platform android --version $versionName --build_num $ciNum --build_mode $buildType
    fi

elif [ $buildPlatform == 'iOS' ]; then
    echo "iOS开始打包"
    ./build_ipa.sh $buildType $versionName $versionCode $debugModel "" $ciNum
    ipaPath=$(find "$projectPath/build/ios/ipa/" -name "*.ipa")
    echo "iOS打包执行完成$ipaPath"
    if [[ ! -f "$ipaPath" ]]; then
        echo "iOS打包执行失败"
        msg="**iOS 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
        python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
        exit 1
    fi
    echo "iOS打包准备上传检查地址是否存在$ipaPath"
    if [ -f "$ipaPath" ]; then
          echo "iOS打包执行上传脚本"
        python3 upload_r2.py --file $ipaPath --app_name $appName --platform ios --version $versionName --build_num $ciNum --build_mode $buildType
    fi
else
    errorCount=0
    ./build_apk.sh $buildType $versionName $versionCode $debugModel $ciNum $abis
    if [ $buildType == 'store' ];then
        bundlePath="$projectPath/build/app/outputs/bundle/chimo_$versionName.aab"
        if [[ ! -f $bundlePath ]]; then
            msg="**Android 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
            python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
            errorCount=$((errorCount + 1))
            exit 1
        fi
    elif [[ ! -f $apkPath ]]; then
        msg="**Android 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
        python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
        errorCount=$((errorCount + 1))
        exit 1
    fi

    if [ -f "$apkPath" ]; then
        python3 upload_r2.py --file $apkPath --app_name $appName --platform android --version $versionName --build_num $ciNum --build_mode $buildType
    fi

    ./build_ipa.sh $buildType $versionName $versionCode $debugModel "" $ciNum
    ipaPath=$(find "$projectPath/build/ios/ipa/" -name "*.ipa")
    if [[ ! -f "$ipaPath" ]]; then
        msg="**iOS 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
        python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
        errorCount=$((errorCount + 1))
    fi
    if [ -f "$ipaPath" ]; then
        python3 upload_r2.py --file $ipaPath --app_name $appName --platform ios --version $versionName --build_num $ciNum --build_mode $buildType
    fi
    if [ $errorCount -ge 2 ];then
        exit 1
    fi
fi

# send success msg to wecom
python3 wechat_notify.py $versionCode "$CHANGE_LOG" $buildType $versionName "$buildPlatform" "$build_info" $ciNum "$buildUser" "$buildBranch"

# save the latest commit id into local file.
last_commit=$(git log -1 --pretty=%h)
echo "$last_commit" >$last_branch_commit_id
