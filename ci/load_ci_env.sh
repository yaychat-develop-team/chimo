#!/usr/bin/env bash
# 加载 CI 密钥（不入库）。优先 source 第一个存在的文件，
# 然后对缺失字段继续做迁移回退，便于复用 joyride 旧打包机配置。
# 用法: source ./load_ci_env.sh

_ci_env_candidates=(
  "${CI_ENV_FILE:-}"
  "$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)/ci.env"
  "${HOME}/.chimo/ci.env"
  "${HOME}/.jenkins/chimo-ci.env"
  # 若打包机上仍保留 joyride 的密钥文件，可复用
  "/Users/doufeng/Documents/work/joyride_flutter/ci/ci.env"
)
_loaded_ci_env=""

for _f in "${_ci_env_candidates[@]}"; do
  if [ -n "${_f}" ] && [ -f "${_f}" ]; then
    # shellcheck disable=SC1090
    set -a
    # shellcheck source=/dev/null
    source "${_f}"
    set +a
    echo "Loaded CI env from ${_f}"
    _loaded_ci_env="${_f}"
    break
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

_load_appstore_from_joyride() {
  local candidates=(
    "/Users/doufeng/Documents/work/joyride_flutter/ci/build_ipa.sh"
    "D:/forya/joyride_flutter/ci/build_ipa.sh"
    "${HOME}/Documents/work/joyride_flutter/ci/build_ipa.sh"
  )
  local src="" f
  for f in "${candidates[@]}"; do
    if [ -f "$f" ]; then
      src=$f
      break
    fi
  done
  [ -z "$src" ] && return 1
  if [ -z "${APP_STORE_API_KEY:-}" ]; then
    APP_STORE_API_KEY=$(sed -n 's/^apiKey="\([^"]*\)".*/\1/p' "$src" | head -n 1)
    export APP_STORE_API_KEY
  fi
  if [ -z "${APP_STORE_API_ISSUER:-}" ]; then
    APP_STORE_API_ISSUER=$(sed -n 's/^apiIssuer="\([^"]*\)".*/\1/p' "$src" | head -n 1)
    export APP_STORE_API_ISSUER
  fi
  if [ -n "${APP_STORE_API_KEY:-}" ] && [ -n "${APP_STORE_API_ISSUER:-}" ]; then
    echo "Loaded App Store API ids from joyride build_ipa.sh (migration fallback)"
    return 0
  fi
  return 1
}

_load_keychain_from_joyride_ci_env() {
  local candidates=(
    "/Users/doufeng/Documents/work/joyride_flutter/ci/ci.env"
    "D:/forya/joyride_flutter/ci/ci.env"
    "${HOME}/Documents/work/joyride_flutter/ci/ci.env"
  )
  local src="" f
  for f in "${candidates[@]}"; do
    if [ -f "$f" ]; then
      src=$f
      break
    fi
  done
  [ -z "$src" ] && return 1

  if [ -z "${KEYCHAIN_PASSWORD:-}" ]; then
    KEYCHAIN_PASSWORD=$(sed -n 's/^KEYCHAIN_PASSWORD=\(.*\)$/\1/p' "$src" | head -n 1)
    export KEYCHAIN_PASSWORD
  fi
  if [ -z "${KEYCHAIN_PATH:-}" ]; then
    KEYCHAIN_PATH=$(sed -n 's/^KEYCHAIN_PATH=\(.*\)$/\1/p' "$src" | head -n 1)
    export KEYCHAIN_PATH
  fi
  if [ -n "${KEYCHAIN_PASSWORD:-}" ] || [ -n "${KEYCHAIN_PATH:-}" ]; then
    echo "Loaded keychain config from joyride ci.env (migration fallback)"
    return 0
  fi
  return 1
}

if [ -z "${R2_ACCESS_KEY_ID:-}" ] || [ -z "${R2_SECRET_ACCESS_KEY:-}" ]; then
  _load_r2_from_joyride || true
fi
if [ -z "${APP_STORE_API_KEY:-}" ] || [ -z "${APP_STORE_API_ISSUER:-}" ]; then
  _load_appstore_from_joyride || true
fi
if [ -z "${KEYCHAIN_PASSWORD:-}" ] || [ -z "${KEYCHAIN_PATH:-}" ]; then
  _load_keychain_from_joyride_ci_env || true
fi
if [ -z "${R2_ACCESS_KEY_ID:-}" ] || [ -z "${R2_SECRET_ACCESS_KEY:-}" ]; then
  echo "No R2 credentials in env/ci.env yet (upload will fail until configured)."
fi
unset _f _ci_env_candidates _loaded_ci_env
unset -f _load_r2_from_joyride _load_appstore_from_joyride _load_keychain_from_joyride_ci_env 2>/dev/null || true
return 0 2>/dev/null || true
