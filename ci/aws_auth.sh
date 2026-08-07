#!/bin/bash

# 1. 检查 jq 是否已安装，未安装则自动安装
# command -v jq &> /dev/null 是一个安全、通用的方法来检查命令是否存在。
# 它的返回值 ($?) 为 0 表示成功，非 0 表示失败。
if ! command -v jq &> /dev/null; then
    echo "jq 命令未找到，正在尝试自动安装..."

    # 判断操作系统类型，并使用对应的包管理器进行安装
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS
        echo "检测到 macOS，使用 Homebrew 安装 jq..."
        if command -v brew &> /dev/null; then
            brew install jq
        else
            echo "错误：未找到 Homebrew。请手动安装 Homebrew (https://brew.sh/) 后重试。"
            return
        fi
    elif [[ -f /etc/debian_version ]]; then
        # 基于 Debian 的 Linux (如 Ubuntu, Debian)
        echo "检测到基于 Debian 的 Linux，使用 apt-get 安装 jq..."
        sudo apt-get update
        sudo apt-get install -y jq
    elif [[ -f /etc/redhat-release ]]; then
        # 基于 Red Hat 的 Linux (如 CentOS, Fedora)
        echo "检测到基于 Red Hat 的 Linux，使用 dnf/yum 安装 jq..."
        if command -v dnf &> /dev/null; then
            sudo dnf install -y jq
        else
            sudo yum install -y jq
        fi
    else
        echo "错误：无法识别您的操作系统类型。请手动安装 jq。"
        echo "更多信息请访问：https://jqlang.github.io/jq/download/"
        return
    fi

    # 再次检查安装是否成功
    if ! command -v jq &> /dev/null; then
        echo "jq 安装失败。请检查您的网络连接或权限，并手动安装。"
        return
    else
        echo "jq 安装成功！"
    fi
else
    echo ""
fi

# 2. 检查必要的环境变量和参数
# 检查环境变量 MFA_SERIAL 是否已配置
if [ -z "$MFA_SERIAL" ]; then
    echo "错误：未配置环境变量 MFA_SERIAL。"
    echo "请执行 'export MFA_SERIAL=\"arn:aws:iam::123456789012:mfa/user\"'"
    return
fi

# 检查是否提供了 MFA 代码作为参数
if [ -z "$1" ]; then
    echo "用法: $0 <mfa-code>"
    return
fi

MFA_CODE="$1"
DURATION=36000  # 临时凭证有效期（秒），可根据需要调整

# 清除环境变量，清空当前会话
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

# 3. 调用 AWS CLI 获取临时凭证
# 使用 --output json 确保输出格式为 JSON，方便 jq 解析
RESPONSE=$(aws sts get-session-token --serial-number "$MFA_SERIAL" --token-code "$MFA_CODE" --duration-seconds "$DURATION" --output json)
# 检查 aws 命令是否成功执行
if [ $? -ne 0 ]; then
    echo "获取临时凭证失败，请检查 MFA 代码、MFA 序列号或 AWS 配置。"
    return
fi

# 4. 使用 jq 解析 JSON 响应并设置环境变量
# -r (raw output) 选项用于去除 jq 输出中的引号，非常重要。
ACCESS_KEY=$(echo "$RESPONSE" | jq -r '.Credentials.AccessKeyId')
SECRET_KEY=$(echo "$RESPONSE" | jq -r '.Credentials.SecretAccessKey')
SESSION_TOKEN=$(echo "$RESPONSE" | jq -r '.Credentials.SessionToken')
EXPIRATION=$(echo "$RESPONSE" | jq -r '.Credentials.Expiration')

# 设置环境变量，使其在当前会话中生效
export AWS_ACCESS_KEY_ID="$ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="$SECRET_KEY"
export AWS_SESSION_TOKEN="$SESSION_TOKEN"

# 5. 验证和确认
echo "临时凭证已设置，有效期至：$EXPIRATION"