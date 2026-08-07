import os
import json
import datetime
import argparse
import boto3
from botocore.client import Config
import zipfile
import plistlib

# ================= 配置 =================
BUILD_DIR = "../build"
BUILD_JSON_KEY_TEMPLATE = "test-apps/{app_name}/{platform}/builds.json"

R2_BUCKET = "test-ci"             # ⚠️ 替换为你的 R2 Bucket
R2_ENDPOINT = os.environ.get(
    "R2_ENDPOINT",
    "https://ed51c713ac21656b4478d8f140ddfd99.r2.cloudflarestorage.com",
)
R2_ACCESS_KEY_ID = os.environ.get("R2_ACCESS_KEY_ID", "")
R2_SECRET_ACCESS_KEY = os.environ.get("R2_SECRET_ACCESS_KEY", "")
if not R2_ACCESS_KEY_ID or not R2_SECRET_ACCESS_KEY:
    raise SystemExit("R2_ACCESS_KEY_ID and R2_SECRET_ACCESS_KEY must be set")

# ================= 初始化 R2 客户端 =================
s3 = boto3.client(
    "s3",
    endpoint_url=R2_ENDPOINT,
    aws_access_key_id=R2_ACCESS_KEY_ID,
    aws_secret_access_key=R2_SECRET_ACCESS_KEY,
    config=Config(signature_version="s3v4")
)

# ================= 工具函数 =================
def upload_file(local_path, r2_key, content_type="application/octet-stream"):
    print(f"✅ 开始上传: {local_path} -> {r2_key}")
    if not os.path.exists(local_path):
        raise FileNotFoundError(f"文件不存在: {local_path}")
    s3.upload_file(
        local_path,
        R2_BUCKET,
        r2_key,
        ExtraArgs={"ACL": "private","ContentType": content_type}
    )
    print(f"✅ 上传成功: {local_path} -> {r2_key}")

def signed_url(r2_key: str, expires_in=3600) -> str:
    """ 返回预签名 URL """
    url = s3.generate_presigned_url(
            "get_object",
            Params={"Bucket": R2_BUCKET, "Key": r2_key},
            ExpiresIn=expires_in
        )
    print(f"🔗 预签名 URL: {r2_key} -> {url}")
    return url

def load_builds(app_name, platform):
    """ 从 R2 获取 builds.json """
    key = BUILD_JSON_KEY_TEMPLATE.format(app_name=app_name, platform=platform)
    tmp_file = f"/tmp/builds_{platform}.json"

    print(f"✅ 获取构建历史: {key} -> {tmp_file}")

    try:
        s3.download_file(R2_BUCKET, key, tmp_file)
        with open(tmp_file, "r", encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        print(f"⚠️ 获取获取构建历史失败: {e}")
        print(f"⚠️ builds.json 不存在，创建新的")
        return {"builds": []}

def save_builds(app_name, platform, data):
    """ 上传更新后的 builds.json """
    key = BUILD_JSON_KEY_TEMPLATE.format(app_name=app_name, platform=platform)
    tmp_file = f"/tmp/builds_{platform}.json"
    content_type = "application/json"
    with open(tmp_file, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    upload_file(tmp_file, key, content_type)
    print(f"✅ {platform} builds.json 更新成功 -> {key}")

def update_plist(plist_path, ipa_url, tmp_plist):
    """ 修改 plist 内的 ipa 下载地址 """
    tree = ET.parse(plist_path)
    root = tree.getroot()

    for url_node in root.findall(".//string"):
        if url_node.text and url_node.text.endswith(".ipa"):
            print(f"🔧 替换 plist url: {url_node.text} -> {ipa_url}")
            url_node.text = ipa_url

    tree.write(tmp_plist, encoding="utf-8", xml_declaration=True)
    return tmp_plist

def generate_ota_plist_from_ipa(ipa_path, output_plist_path, ipa_url):
    """
    从 Flutter 打包的 IPA 文件读取 Info.plist 并生成 OTA 安装 plist

    参数:
    - ipa_path: str, 本地 IPA 文件路径
    - output_plist_path: str, 输出 OTA plist 文件路径
    - ipa_url: str, IPA 文件在服务器的 HTTPS 地址
    """
    # 临时解压目录
    temp_dir = "temp_ipa_extract"
    os.makedirs(temp_dir, exist_ok=True)

    # 解压 IPA
    with zipfile.ZipFile(ipa_path, 'r') as zip_ref:
        zip_ref.extractall(temp_dir)

    # IPA 内 Info.plist 路径
    info_plist_path = None
    payload_path = os.path.join(temp_dir, "Payload")
    for root, dirs, files in os.walk(payload_path):
        if "Info.plist" in files:
            info_plist_path = os.path.join(root, "Info.plist")
            break

    if not info_plist_path:
        raise FileNotFoundError("IPA 内未找到 Info.plist")

    # 读取 Info.plist
    with open(info_plist_path, "rb") as f:
        info = plistlib.load(f)

    bundle_identifier = info.get("CFBundleIdentifier", "com.example.app")
    bundle_version = info.get("CFBundleShortVersionString", "1.0.0")
    title = info.get("CFBundleDisplayName", info.get("CFBundleName", "应用"))

    # 构建 OTA plist 内容
    ota_plist = {
        "items": [
            {
                "assets": [
                    {
                        "kind": "software-package",
                        "url": ipa_url
                    }
                ],
                "metadata": {
                    "bundle-identifier": bundle_identifier,
                    "bundle-version": bundle_version,
                    "kind": "software",
                    "title": title
                }
            }
        ]
    }

    # 写入 OTA plist
    with open(output_plist_path, "wb") as f:
        plistlib.dump(ota_plist, f)

    # 清理临时目录
    import shutil
    shutil.rmtree(temp_dir)

    print(f"OTA plist 已生成: {output_plist_path}")
    print(f"Bundle ID: {bundle_identifier}, Version: {bundle_version}, Title: {title}")

def cdn_url(r2_key):
    """ 返回 Cloudflare R2 的 CDN URL """
    return f"https://static.ak7.co/{r2_key}"

# ================= 主函数 =================
def main():
    parser = argparse.ArgumentParser(description="上传内测版本到 Cloudflare R2")
    parser.add_argument("--file", required=True, help="文件路径")
    parser.add_argument("--app_name", required=True, help="App 名称")
    parser.add_argument("--platform", required=True, choices=["android","Android","ios","iOS"], help="平台 android/ios")
    parser.add_argument("--build_num", required=True, type=int, default=1, help="build号")
    parser.add_argument("--version", required=True, default="1.0.0", help="版本号，例如 1.0.0")
    parser.add_argument("--build_mode", default="release", choices=["release","profile","debug"], help="构建模式")
    args = parser.parse_args()

    file = args.file
    app_name = args.app_name
    platform = args.platform.lower()
    version = args.version
    build_num = args.build_num
    build_mode = args.build_mode.lower()
    url_expire = 604800 #预签名url有效期（秒）

    builds_data = load_builds(app_name, platform)
    build_entry = {
        "version": version,
        "platform": platform,
        "build_num": build_num,
        "build_mode": build_mode,
        "uploaded_at": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }

    target_path = f"test-apps/{app_name}/{platform}/{app_name}-{build_mode}-{version}-{build_num}"

    try:
        if platform == "android":
            content_type = "application/vnd.android.package-archive"
            apk_target_path = f"{target_path}.apk"

            # 上传APK文件
            upload_file(file, apk_target_path, content_type)

            # 添加构建记录
            build_entry["apk"] = apk_target_path
            build_entry["apk_url"] = cdn_url(apk_target_path)
            #build_entry["apk_url"] = signed_url(apk_target_path, expires_in=url_expire)
        elif platform == "ios":
            ipa_content_type = "application/octet-stream"
            ipa_target_path = f"{target_path}.ipa"

            # 上传IPA文件
            upload_file(file, ipa_target_path, ipa_content_type)

            # 添加构建记录
            build_entry["ipa"] = ipa_target_path
            build_entry["ipa_url"] = cdn_url(ipa_target_path)
            #build_entry["ipa_url"] = signed_url(ipa_target_path, expires_in=url_expire)

            # 生成plist
            plist_file = f"/tmp/app_{build_num}.plist"
            generate_ota_plist_from_ipa(file, plist_file, build_entry["ipa_url"])

            # 上传plist文件
            plist_content_type = "application/x-plist"
            upload_file(plist_file, f"{target_path}.plist", plist_content_type)

            # 添加plist记录
            build_entry["plist"] = f"{target_path}.plist"
            build_entry["plist_url"] = cdn_url(build_entry["plist"])
            #build_entry["plist_url"] = signed_url(build_entry["plist"], expires_in=url_expire)
        else:
            print(f"❌ Unknown platform: {platform}")
            return
    except Exception as e:
        print(f"❌ 上传失败: {e}")
        return

    builds_data["builds"].insert(0, build_entry)
    save_builds(app_name, platform, builds_data)

    print(f"✅ 上传完成: {app_name} {platform} {version} {build_mode}")
    print(f"历史记录 URL (builds.json): {BUILD_JSON_KEY_TEMPLATE.format(app_name=app_name, platform=platform)}")

if __name__ == "__main__":
    main()