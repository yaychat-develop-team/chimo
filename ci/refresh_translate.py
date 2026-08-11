import requests
import os
import subprocess

current_file_path = os.path.abspath(__file__)
parent_dir = os.path.dirname(current_file_path)  # 获取当前文件的父目录
grandparent_dir = os.path.dirname(parent_dir)  # 获取当前文件的上级目录
resource_dic = grandparent_dir + '/packages_local/resource/lib/arbs/'

api_url = os.environ.get(
    'TRANSLATION_API_URL',
    'https://opadmin-api.echimo.com/content/translation/exportTranslation',
)
headers = {"Accept-Language": "zh-CN,zh;q=0.9", "Content-Type": "application/json;charset=UTF-8"}


def download_file_with_post(en):
    lan = "en" if en else "zh_cn"
    post_data = {"lan": lan, "project": os.environ.get('TRANSLATION_PROJECT', 'chimo-client')}
    output_file = 'intl_en.arb' if en else 'intl_zh.arb'
    output_path = resource_dic + output_file

    # 发起 POST 请求
    response = requests.post(api_url, stream=True, headers=headers, json=post_data)

    # 检查请求是否成功
    if response.status_code == 200:
        # 以二进制写入模式打开文件，开始写入数据
        with open(output_path, 'wb') as file:
            for chunk in response.iter_content(chunk_size=8192):
                file.write(chunk)

        print(f"文件成功保存到 {output_path}")
    else:
        print(f"请求失败，状态码：{response.status_code}")


if __name__ == '__main__':
    print("开始下载：英文")
    download_file_with_post(True)
    print("开始下载：中文")
    download_file_with_post(False)
    print(f"commandDic：{grandparent_dir}")
    command = 'flutter pub global run intl_utils:generate'
    subprocess.run(command, cwd=grandparent_dir, shell=True)
