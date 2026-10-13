#!/usr/bin/env bash
set -euo pipefail

# 日志出口卡口（docs/优化步骤/S01-日志脱敏与AppLog.md）
#
# print 与 debugPrint 在 release 包里都不会被剥掉，内容会写进 iOS os_log 与
# Android logcat —— 任何拿到设备的人（或连着 Mac 的 Console.app）都能读到
# 手机号、验证码、token、环信密码。全项目唯一的日志出口是
# lib/common/utils/app_log.dart 的 AppLog：release 默认关闭，且进 sink 的每一行
# 都按字段名打过码。
#
# 用 grep 而不是 git grep：git grep 默认跳过未跟踪文件，新加的文件能带着
# print 悄悄过卡口（本项目就出现过 —— app_storage.dart 未跟踪，6 处
# debugPrint 因此漏掉了一整轮迁移）。
#
# 单独跑：./ci/check_logging.sh（在仓库根目录或 ci/ 下都行）

cd "$(dirname "$0")/.."

fail=0

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

# 1. 裸 print
hits=$(grep -rnE "(^|[^A-Za-z._'\"])print[[:space:]]*\(" --include='*.dart' lib || true)
report "无裸 print（改用 AppLog.d/i/w/e/net）" "$hits"

# 2. 抑制 avoid_print
hits=$(grep -rn "ignore: avoid_print" --include='*.dart' lib || true)
report "无 // ignore: avoid_print（analysis_options.yaml 里这条是有意开的）" "$hits"

# 3. debugPrint 只允许出现在 AppLog 自己的 sink 里
hits=$(grep -rnE "debugPrint[[:space:]]*\(" --include='*.dart' lib \
    | grep -v '^lib/common/utils/app_log.dart:' || true)
report "debugPrint 仅存在于 lib/common/utils/app_log.dart" "$hits"

if [ "$fail" -ne 0 ]; then
    echo "" >&2
    echo "日志卡口未通过。见 docs/优化步骤/S01-日志脱敏与AppLog.md。" >&2
    exit 1
fi

echo "日志卡口全部通过。"
