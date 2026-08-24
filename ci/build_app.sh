#!/usr/bin/env bash
set -euo pipefail

appName=$1
buildPlatform=$2
buildType=$3
versionName=$4
versionCode=$5
debugModel=$6
ciNum=$7
buildUser=$8
buildBranch=$9
abis=${10:-arm64-v8a}

# shellcheck source=load_ci_env.sh
source "$(dirname "$0")/load_ci_env.sh"

function currentTimeStamp(){
    cs=`date '+%s'`
    cms=`expr $cs \* 1000`
}

upload_to_r2() {
    local file=$1
    local platform=$2
    if [ -z "${R2_ACCESS_KEY_ID:-}" ] || [ -z "${R2_SECRET_ACCESS_KEY:-}" ]; then
        if [ -z "${AWS_ACCESS_KEY_ID:-}" ] || [ -z "${AWS_SECRET_ACCESS_KEY:-}" ]; then
            echo "ERROR: R2 credentials missing. Create ci/ci.env from ci/ci.env.example or set Jenkins env R2_ACCESS_KEY_ID / R2_SECRET_ACCESS_KEY." >&2
            return 1
        fi
    fi
    python3 upload_r2.py \
        --file "$file" \
        --app_name "$appName" \
        --platform "$platform" \
        --version "$versionName" \
        --build_num "$ciNum" \
        --build_mode "$buildType"
}

has_app_store_api() {
    [ -n "${APP_STORE_API_KEY:-}" ] && [ -n "${APP_STORE_API_ISSUER:-}" ]
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

# 保存 submodule b 的 last_base_commit
last_commit=$(git log -1 --pretty=%h)
# 保存最近一次 commit，便于回滚
echo "$last_commit" >$last_commit_id

if [ -f "$last_branch_commit_id" ]; then
    last_commit="$(cat $last_branch_commit_id)"
fi

# 向企业微信发送开始构建消息
python3 wechat_notify.py 0 "Start Building $ciNum 号包..." "" "" "" "" "$ciNum" "$buildUser" "$buildBranch"

lastest_commit=$(git log -1 --pretty=%h)
CHANGE_LOG=$(git shortlog --pretty=format:"- **%s** %ar" "$last_commit".."$lastest_commit" || true)

apkPath="$projectPath/build/app/outputs/apk/chimo_${buildType}_${ciNum}.apk"
if [ "$buildPlatform" == 'Android' ]; then
    ./build_apk.sh "$buildType" "$versionName" "$versionCode" "$debugModel" "$ciNum" "$abis"
    if [ "$buildType" == 'store' ];then
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
        upload_to_r2 "$apkPath" android
    fi

elif [ "$buildPlatform" == 'iOS' ]; then
    echo "iOS开始打包"
    ./build_ipa.sh "$buildType" "$versionName" "$versionCode" "$debugModel" "" "$ciNum"
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
        upload_to_r2 "$ipaPath" ios
    fi
else
    errorCount=0
    ./build_apk.sh "$buildType" "$versionName" "$versionCode" "$debugModel" "$ciNum" "$abis"
    if [ "$buildType" == 'store' ];then
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
        upload_to_r2 "$apkPath" android
    fi

    ./build_ipa.sh "$buildType" "$versionName" "$versionCode" "$debugModel" "" "$ciNum"
    ipaPath=$(find "$projectPath/build/ios/ipa/" -name "*.ipa")
    if [[ ! -f "$ipaPath" ]]; then
        msg="**iOS 打包失败**，[请检查](http://192.168.3.123:8080/job/Pack%20App/)"
        python3 wechat_notify.py -1 "$msg" '' '' "" "" 0 "$buildUser" "$buildBranch"
        errorCount=$((errorCount + 1))
    fi
    if [ -f "$ipaPath" ]; then
        upload_to_r2 "$ipaPath" ios
    fi
    if [ $errorCount -ge 2 ];then
        exit 1
    fi
fi

# 向企业微信发送成功消息
python3 wechat_notify.py "$versionCode" "$CHANGE_LOG" "$buildType" "$versionName" "$buildPlatform" "$build_info" "$ciNum" "$buildUser" "$buildBranch"

# 将最新 commit id 写入本地文件。
last_commit=$(git log -1 --pretty=%h)
echo "$last_commit" >$last_branch_commit_id
