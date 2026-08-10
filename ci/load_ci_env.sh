#!/usr/bin/env bash
# 加载 CI 密钥（不入库）。按优先级依次 source 第一个存在的文件。
# 用法: source ./load_ci_env.sh

_ci_env_candidates=(
  "${CI_ENV_FILE:-}"
  "$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)/ci.env"
  "${HOME}/.chimo/ci.env"
  "${HOME}/.jenkins/chimo-ci.env"
  # 若打包机上仍保留 joyride 的密钥文件，可复用
  "/Users/doufeng/Documents/work/joyride_flutter/ci/ci.env"
)

for _f in "${_ci_env_candidates[@]}"; do
  if [ -n "${_f}" ] && [ -f "${_f}" ]; then
    # shellcheck disable=SC1090
    set -a
    # shellcheck source=/dev/null
    source "${_f}"
    set +a
    echo "Loaded CI env from ${_f}"
    unset _f _ci_env_candidates
    return 0 2>/dev/null || exit 0
  fi
done

# 迁移回退：从本机仍存在的 joyride upload_r2.py 读取硬编码 R2 密钥（不打印密钥）
_load_r2_from_joyride() {
  local candidates=(
    "/Users/doufeng/Documents/work/joyride_flutter/ci/upload_r2.py"
    "D:/forya/joyride_flutter/ci/upload_r2.py"
    "${HOME}/Documents/work/joyride_flutter/ci/upload_r2.py"
  )
  local src=""
  local f
  for f in "${candidates[@]}"; do
    if [ -f "$f" ]; then
      src=$f
      break
    fi
  done
  [ -z "$src" ] && return 1
  if [ -z "${R2_ACCESS_KEY_ID:-}" ]; then
    R2_ACCESS_KEY_ID=$(sed -n 's/.*aws_access_key_id="\([^"]*\)".*/\1/p' "$src" | head -n 1)
    export R2_ACCESS_KEY_ID
  fi
  if [ -z "${R2_SECRET_ACCESS_KEY:-}" ]; then
    R2_SECRET_ACCESS_KEY=$(sed -n 's/.*aws_secret_access_key="\([^"]*\)".*/\1/p' "$src" | head -n 1)
    export R2_SECRET_ACCESS_KEY
  fi
  if [ -n "${R2_ACCESS_KEY_ID:-}" ] && [ -n "${R2_SECRET_ACCESS_KEY:-}" ]; then
    echo "Loaded R2 credentials from joyride upload_r2.py (migration fallback)"
    return 0
  fi
  return 1
}

if [ -z "${R2_ACCESS_KEY_ID:-}" ] || [ -z "${R2_SECRET_ACCESS_KEY:-}" ]; then
  _load_r2_from_joyride || echo "No ci.env found (optional). Relying on process environment for R2/App Store keys."
fi
unset _f _ci_env_candidates
unset -f _load_r2_from_joyride 2>/dev/null || true
return 0 2>/dev/null || true
