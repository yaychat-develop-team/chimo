#!/usr/bin/env bash
set -euo pipefail

# 导航出口卡口（docs/优化步骤/S08-深链RouteIntent与导航卡口.md，方案 4.6 第 4 条）
#
# 全项目唯一的跳转出口是 lib/app/app_jumper.dart，唯一的路由表是
# lib/app/routes/app_pages.dart。别处出现 MaterialPageRoute / Navigator.push /
# Get.toNamed 就意味着又开了一条绕过路由表的轨道 —— 现有 AppJumper 就是活例子：
# 建好了、0 处调用、还带着一个必抛异常的 bug（方案 6.1）。
#
# 用 grep 而不是 git grep：git grep 会跳过未跟踪文件（见 check_logging.sh 的说明）。
#
# 例外标注方式：在调用点上方写一行含「未收口」的注释，说明是哪一步收、为什么现在
# 收不了（当前 5 处：2 个私有页面类进不了路由表 + 3 处带回调，见 S05/S06 工单；
# 群聊图片查看器那处在 S20 随查看器合一收掉了）。
# 本脚本会跳过「未收口」注释后 4 行内的匹配。
#
# 单独跑：./ci/check_navigation.sh

cd "$(dirname "$0")/.."

fail=0
NAV_PATTERN='MaterialPageRoute|Navigator\.(of\([^)]*\)\.)?(push|pop|maybePop|popUntil)|Get\.(to|off|toNamed|offNamed|offAll|until|back)'

report() {
    local title=$1
    local hits=$2
    if [ -n "$hits" ]; then
        echo "❌ $title" >&2
        echo "$hits" >&2
        fail=1
    else
        echo "✅ $title"
    fi
}

# 1. 导航 API 只允许出现在 app_jumper / app_pages
hits=$(find lib -name '*.dart' \
    ! -path 'lib/app/app_jumper.dart' \
    ! -path 'lib/app/routes/app_pages.dart' -print0 \
    | xargs -0 awk -v pat="$NAV_PATTERN" '
        FNR == 1 { skip = 0; marked = 0 }
        { line = $0; sub(/^[[:space:]]+/, "", line) }
        # 注释行：不算调用点；标了「未收口」的注释块把例外窗口一路推到块末
        line ~ /^(\/\/|\*)/ {
            if (line ~ /未收口/) marked = 1
            if (marked) skip = FNR + 4
            next
        }
        { marked = 0 }
        $0 ~ pat {
            if (FNR <= skip) next
            printf "%s:%d: %s\n", FILENAME, FNR, line
        }' || true)
report "导航 API 只在 app_jumper / app_pages（例外需标「未收口」）" "$hits"

if [ "$fail" -ne 0 ]; then
    echo "" >&2
    echo "导航卡口未通过。见 docs/优化步骤/S08-深链RouteIntent与导航卡口.md。" >&2
    exit 1
fi

# 注：core → features 的反向依赖已经清零（S16 复核），完整卡口在
# `ci/check_layers.sh` 卡口 1（core / shared / models 全都不许 import features）。
echo "导航卡口全部通过。"
