#! /usr/bin/env python3

#-*- coding:UTF-8 -*-（添加）
import os
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

url = os.environ.get('SLACK_WEBHOOK_URL', '')
if not url:
    raise SystemExit('SLACK_WEBHOOK_URL is not set')
headers = {
    'Content-Type': 'application/json'
}

userName = buildUser
if buildUser.startswith('U0'):
    userName = f'<@{buildUser}>'

if int(buildNum) < 0:
    changeLog=""+sys.argv[2]
    logValues ={
        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f":cold_face:::cold_face: *{changeLog}*！\n>*Branch:* `{buildBranch}`"
                }
            },
            {
                "type": "divider"
            }
        ]
    }
    logResponse = requests.post(url, data = json.dumps(logValues), headers = headers)
elif int(buildNum) == 0:
    changeLog=""+sys.argv[2]
    logValues = {
        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f":hammer::hammer_and_wrench: *{userName}* Start Building `{ciNum}` 号包！\n>*Branch:* `{buildBranch}`"
                }
            },
            {
                "type": "divider"
            }
        ]
    }
    logResponse = requests.post(url, data = json.dumps(logValues), headers = headers)
    print(logResponse.text)
else:
    jump_list = []
    intel_jump={
        "type":1,
        "url":"http://172.19.20.79:6688/",
        "title": "内部下载地址"
    }

    pgy_jum={
        "type":1,
        "url":"https://www.pgyer.com/partying",
        "title": "蒲公英下载地址"
    }

    jump_list.append(intel_jump)
    jump_list.append(pgy_jum)

    title = f"Partying {ciNum} 号包"
    description = f"{buildType}打好了~~~"
    articlesUrl = "https://www.pgyer.com/partying"

    if buildType == "store":
        titleDict = {'All': f"Partying {versionName} 已上传Google Play & App Store", 
                    'iOS': f"Partying {versionName} 已上传App Store", 
                    'Android': f"Partying {versionName} 已上传Google Play"}
        title = titleDict[buildPlatform]
        descDict = {'All': f"Partying {versionName} 已上传至Google Play 草稿箱和 TestFlight，注意提审！",
                    'iOS': f"Partying {versionName} 已上传至TestFlight，注意提审！",
                    'Android': f"Partying {versionName} 已上传至Google Play 草稿箱，注意提审！"}
        description = descDict[buildPlatform]
        jump_list=[]
    elif buildType == "channel":
        title = f"Partying {versionName} 渠道包已打好"
        description = f"Partying {versionName} 渠道包已打好，注意分发！"
        articlesUrl = f"https://dl.1dmy.com/apk/pt-channel-{versionName}-{buildNum}/"
        jump_list=[]

    msg = "暂无记录"
    if buildType == 'debug' or buildType == 'release':
        if(len(sys.argv) > 2 and len(sys.argv[2]) > 0):
            changeLog=""+sys.argv[2]
        msg = (changeLog[:2000] + '..') if len(changeLog) > 2000 else changeLog

    values = {
        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f":tada::pt::tada: *Partying* `{ciNum}` 号包打好了"
                }
            },
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f"*BuildType:*\n`{buildType}`\n*Trigger:*\n*{userName}*\n*Branch:*\n `{buildBranch}`\n*ChangeLogs:* \n```{msg}```"
                },
                "accessory": {
                    "type": "image",
                    "image_url": "https://s3.bmp.ovh/imgs/2021/12/6f9a6233af95bb6a.png",
                    "alt_text": "computer thumbnail"
                }
            },
            {
                "type": "divider"
            },
            {
                "type": "actions",
                "elements": [
                    {
                        "type": "button",
                        "text": {
                            "type": "plain_text",
                            "text": "Android下载",
                            "emoji": True
                        },
                        "style": "primary",
                        # http://172.19.20.79:6688/files/apk/partying_debug_1000.apk
                        "url": f"http://172.19.20.79:6688/files/apk/partying_{buildType}_{ciNum}.apk",
                        "value": "download_app",
                        "action_id": "actionId-0"
                    },
                    {
                        "type": "button",
                        "text": {
                            "type": "plain_text",
                            "text": "iOS下载",
                            "emoji": True
                        },
                        "style": "primary",
                        "url": f"http://172.19.20.79:6688/files/apk/partying_{buildType}_{ciNum}.ipa",
                        "value": "download_app",
                        "action_id": "actionId-1"
                    },
                    {
                        "type": "button",
                        "text": {
                            "type": "plain_text",
                            "text": "内部地址下载",
                            "emoji": True
                        },
                        "style": "primary",
                        "url": "http://172.19.20.79:6688",
                        "value": "download_app",
                        "action_id": "actionId-3"
                    },
                    {
                        "type": "button",
                        "text": {
                            "type": "plain_text",
                            "text": "蒲公英地址下载",
                            "emoji": True
                        },
                        "style": "primary",
                        "url": "https://pgyer.com/partying",
                        "value": "download_app",
                        "action_id": "actionId-2"
                    }
                ]
            }
        ]
    }

    response = requests.post(url, data = json.dumps(values), headers = headers)
    print(response.text)


