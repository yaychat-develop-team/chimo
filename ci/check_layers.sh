#!/usr/bin/env bash
set -euo pipefail

# 分层卡口（docs/优化步骤/S16-抽Controller-列表页与打开卡口.md，方案 4.6 第 1–3 条）
#
#   1. common 不得依赖 modules；app 里只有 app_jumper 可以依赖 modules
#   2. Controller 不得 import material   —— 一旦 import，逻辑就会重新长回 widget 里
#   3. View 不得直连 API / IM / 存储     —— 取数散在页面里，页面就没法拆也没法测
#
# 第 4 条（导航出口只在 app_jumper / app_pages）在 ci/check_navigation.sh，
# 那条已经绿了，不搬过来。
#
# 用 grep / find 而不是 git grep：git grep 会跳过未跟踪文件（见 check_logging.sh）。
#
# 卡口 1、2 是硬红线：一处都不许有。
# 卡口 3 的白名单 ci/layer_allowlist.txt 现在是空的，所以它也是硬红线。
# 文件还留着，是为了临时钉一处时有地方写：数字多了红，数字少了也红。
#
# 单独跑：./ci/check_layers.sh

cd "$(dirname "$0")/.."

fail=0
ALLOWLIST=ci/layer_allowlist.txt

# 不用 \b：BSD awk 不认。前后各留一个「非标识符字符」的边界。
DIRECT_PATTERN='(^|[^A-Za-z0-9_$])(AppApis|ImService|AuthSession|AppStorage|Hive|SharedPreferences)\.'

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

# ---------------------------------------------------------------- 1. 反向依赖
hits=$(
    {
        grep -rn "modules/" --include='*.dart' lib/common || true
        grep -rn "modules/" --include='*.dart' lib/app || true
    } | grep -v -E '^(lib/app/app_jumper.dart|lib/app/app.dart):' || true
)
report "common / app 不依赖 modules（app_jumper 除外）" "$hits"

# ---------------------------------------------------------------- 2. Controller 不碰 material
#
# Logic 按 logic/ 目录和 *_logic.dart 文件名一起扫。
logic_files() {
    find lib -name '*_logic.dart' -o -path '*/logic/*.dart' \
        | sort -u
}
hits=$(logic_files | xargs grep -n "package:flutter/material.dart" 2>/dev/null || true)
report "Logic 不 import package:flutter/material.dart" "$hits"

# ---------------------------------------------------------------- 3. View 不直连取数
#
# View 层 = modules 下的 page，加上公共 widgets。logic / model 不算 View。
view_files() {
    find lib/modules lib/common/widgets -name '*.dart' \
        ! -path '*/logic/*' ! -path '*/model/*' \
        | sort
}

# 注释行不算调用点（和 check_navigation.sh 同一套判断）。
scan_direct() {
    xargs awk -v pat="$DIRECT_PATTERN" '
        { line = $0; sub(/^[[:space:]]+/, "", line) }
        line ~ /^(\/\/|\*|\/\*)/ { next }
        $0 ~ pat { printf "%s:%d: %s\n", FILENAME, FNR, line }'
}

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

view_files | scan_direct > "$tmp/hits.txt" || true
awk -F: '{ print $1 }' "$tmp/hits.txt" | sort | uniq -c \
    | awk '{ print $1, $2 }' | sort -k2 > "$tmp/actual.txt"
grep -v -E '^[[:space:]]*(#|$)' "$ALLOWLIST" | awk '{ print $1, $2 }' | sort -k2 > "$tmp/allowed.txt" || true

drift=$(awk '
    NR == FNR { allowed[$2] = $1; next }
    { actual[$2] = $1 }
    END {
        for (f in actual) {
            if (!(f in allowed))
                printf "  + %s：%d 处直连，不在白名单里 —— 新代码别往 View 里写取数\n", f, actual[f]
            else if (actual[f] > allowed[f])
                printf "  + %s：%d 处 > 白名单允许的 %d 处\n", f, actual[f], allowed[f]
        }
        for (f in allowed) {
            if (!(f in actual))
                printf "  - %s：已清零，把这一行从白名单删掉\n", f
            else if (actual[f] < allowed[f])
                printf "  - %s：只剩 %d 处（白名单还写着 %d），把数字改小\n", f, actual[f], allowed[f]
        }
    }' "$tmp/allowed.txt" "$tmp/actual.txt" | sort)

remaining=$(wc -l < "$tmp/hits.txt" | tr -d ' ')
files=$(wc -l < "$tmp/actual.txt" | tr -d ' ')
report "View 不直连 API / IM / 存储（白名单：$remaining 处 / $files 文件，只能变小）" "$drift"

if [ "$fail" -ne 0 ]; then
    echo "" >&2
    echo "分层卡口未通过。见 docs/优化步骤/S16-抽Controller-列表页与打开卡口.md。" >&2
    echo "卡口 3 的白名单在 $ALLOWLIST —— 搬完一个文件就把它那一行删掉。" >&2
    exit 1
fi

if [ "$remaining" -eq 0 ]; then
    echo "分层卡口全部通过（卡口 3 已是硬红线：View 不得直连 API / IM / 存储）。"
else
    echo "分层卡口全部通过（卡口 3 还欠 $remaining 处 —— 归属见 $ALLOWLIST 的头注）。"
fi
