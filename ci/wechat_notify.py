#! /usr/bin/env python3

#-*- coding:UTF-8 -*-（添加）
import sys
import requests
import json
buildNum=sys.argv[1]
changeLog="no changes"
buildType=sys.argv[3]
versionName=sys.argv[4]
buildPlatform=sys.argv[5]
buildInfo=sys.argv[6]
ciNum=sys.argv[7]
buildUser=sys.argv[8]
buildBranch=sys.argv[9]

# 研发总群
url = 'https://open.larksuite.com/open-apis/bot/v2/hook/02fe9415-d2af-4508-a514-b348112c0fdd'

# 一起兜风
yqdf_url = 'https://open.feishu.cn/open-apis/bot/v2/hook/d8c2fae9-528a-44d0-9458-7991478723f3'

# 运营测试
# test_url = 'https://open.feishu.cn/open-apis/bot/v2/hook/10c2f5c2-9ab8-4a67-8d8b-48d314f10aaa'

headers = {
    'Content-Type': 'application/json'
}

if int(buildNum) < 0:
    changeLog=""+sys.argv[2]
    logValues = {
        "msg_type": "text",
        "content": {
            "text": f"{changeLog}"
        }
    }
    logResponse = requests.post(url, data = json.dumps(logValues), headers = headers)
    print(logResponse.text)
elif int(buildNum) == 0:
    logValues = {
        "msg_type": "post",
        "content": {
            "post": {
                "zh_cn": {
                    "title": "开始打包",
                    "content": [
                        [
                            {
                            "tag": "text",
                            "text": f"{buildUser}  ",
                            },
                            {
                                "tag": "text",
                                "text": f"Start Building {ciNum} 号包！",
                            }
                        ],
                        [
                            {
                                "tag": "text",
                                "text": f"Branch: {buildBranch} ",
                            },
                        ]
                    ]
                }
            }
        }
    }
    logResponse = requests.post(url, data = json.dumps(logValues), headers = headers)
    print(logResponse.text)
else:
    if(len(sys.argv) > 2 and len(sys.argv[2]) > 0):
        changeLog=""+sys.argv[2]
    msg = (changeLog[:2000] + '..') if len(changeLog) > 2000 else changeLog

    values = {
        "msg_type": "interactive",
        "card": {
            "config": {
                "wide_screen_mode": True
            },
            "elements": [
                {
                    "tag": "column_set",
                    "flex_mode": "none",
                    "background_style": "grey",
                    "columns": [
                        {
                            "tag": "column",
                            "width": "weighted",
                            "weight": 2,
                            "vertical_align": "center",
                            "elements": [
                                {
                                    "tag": "markdown",
                                    "content": f"\n**🤠打包人：** <font color='red'>{buildUser}</font>\n\n**🛤️分支：**<font color='green'> {buildBranch}</font>\n\n**⚓打包类型：**<font color='green'> {buildType}</font>\n\n**🎯包号：**<font color='green'> {ciNum}</font>",
                                    "text_align": "left"
                                }
                            ]
                        },
                        {
                            "tag": "column",
                            "width": "weighted",
                            "weight": 1,
                            "vertical_align": "top",
                            "elements": [
                                {
                                    "tag": "img",
                                    "img_key": "img_v3_02qh_f645c442-65eb-4253-93be-cff7eed2a9hu",
                                    "alt": {
                                        "tag": "plain_text",
                                        "content": ""
                                    },
                                    "mode": "crop_center",
                                    "preview": True,
                                    "compact_width": True
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "column_set",
                    "flex_mode": "none",
                    "background_style": "default",
                    "columns": []
                },
                {
                    "tag": "div",
                    "text": {
                        "content": "**📖 Changelogs：**",
                        "tag": "lark_md"
                    }
                },
                {
                    "tag": "column_set",
                    "flex_mode": "none",
                    "background_style": "grey",
                    "columns": [
                        {
                            "tag": "column",
                            "width": "weighted",
                            "weight": 1,
                            "vertical_align": "top",
                            "elements": [
                                {
                                    "tag": "div",
                                    "text": {
                                        "content": f"{msg}\n",
                                        "tag": "lark_md"
                                    }
                                }
                            ]
                        }
                    ]
                },
                {
                    "tag": "action",
                    "actions": [
                        {
                            "tag": "button",
                            "text": {
                                "tag": "plain_text",
                                "content": "Android下载"
                            },
                            "type": "primary",
                            "multi_url": {
                                "url": f"http://192.168.50.153:9992/yaychat_{buildType}_{ciNum}.apk",
                                "pc_url": "",
                                "android_url": "",
                                "ios_url": ""
                            }
                        }
                    ]
                }
            ],
            "header": {
                "template": "yellow",
                "title": {
                    "content": f"🔥🔥🔥 Yaychat {ciNum} 号包",
                    "tag": "plain_text"
                }
            }
        }
    }

    response = requests.post(url, data = json.dumps(values), headers = headers)
    print(response.text)

#     requests.post(yqdf_url, data = json.dumps(values), headers = headers)

    # requests.post(test_url, data = json.dumps(values), headers = headers)


