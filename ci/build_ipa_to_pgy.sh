#!/bin/bash
versionName=$1
ciNum=$2
buildType=$3
BRANCH="oumi_test"
export LANG=en_US.UTF-8
projectPath="$(dirname "$(dirname "$0")")"
echo "$projectPath"
cd "$projectPath"
source "$projectPath/ci/git_utils.sh"
git reset --hard HEAD
checkout_and_pull $BRANCH
flutter pub get
cd ci
chmod +x *.sh
./build_app.sh chimo iOS "$buildType" "$versionName" 10 enable "$ciNum" Giant $BRANCH "armeabi-v7a,arm64-v8a"