#!/bin/bash
#set -x #echo on

cd proto
git pull
cd ..
#export JOYRIDE_ANDROID=./android
#export JOYRIDE_FLUTTER=.
#./bin/jrutil -d

# 检查 protoc
check_protoc() {
  if command -v protoc &> /dev/null; then
      PROTOC_VERSION=$(protoc --version | awk '{print $2}')
      echo "Found protoc version: $PROTOC_VERSION"
  else
      echo "Error: protoc is not installed"
      echo "  macOS: brew install protobuf"
      echo "  Ubuntu: sudo apt install -y protobuf-compiler"
      exit 1
  fi
}

# 检查 protoc_plugin
check_dart_plugin() {
    local required_version="$1"

    if ! command -v protoc-gen-dart &> /dev/null; then
        echo "Error: protoc-gen-dart not found, make sure you have ~/.pub-cache/bin in your PATH."
        return 1
    fi

    # 获取当前版本 (protoc_plugin 的版本)
    local current_version=$(dart pub global list | grep protoc_plugin | awk '{print $2}')

    if [ -z "$current_version" ]; then
        echo "Error: Could not determine protoc_plugin version"
        return 1
    fi

    # 版本比较
    if [ "$(printf '%s\n' "$required_version" "$current_version" | sort -V | head -n1)" = "$required_version" ]; then
        return 0
    else
        echo "❌ Version $current_version is lower than required $required_version"
        return 1
    fi
}

check_protoc || exit 1

if ! check_dart_plugin "25.0.0"; then
    echo "Updating dart protoc_plugin..."
    dart pub global activate protoc_plugin
fi

dart run scripts/build_proto.dart
