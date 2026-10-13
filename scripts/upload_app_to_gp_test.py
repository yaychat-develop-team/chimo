#!/usr/bin/python
#
# Copyright 2014 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the 'License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Uploads apk to alpha track and updates its listing properties."""
import os
try:
    import googleapiclient
except ImportError:
    print("installing googleapiclient.......")
    res = os.system("pip3 install google-api-python-client")
    if res != 0:
        print("install success")

try:
    import oauth2client
except ImportError:
    print("installing oauth2client.......")
    res = os.system("pip3 install oauth2client")
    if res != 0:
        print("install success")


import argparse
import sys
from oauth2client import client
from oauth2client.service_account import ServiceAccountCredentials
import httplib2
from apiclient.discovery import build
from googleapiclient.http import MediaFileUpload
import mimetypes
import socket

socket.setdefaulttimeout(7 * 24 * 60 * 60)
mimetypes.add_type("application/octet-stream", ".apk")
mimetypes.add_type("application/octet-stream", ".aab")

TRACK = 'production'  # Can be 'alpha', beta', 'production' or 'rollout'

releaseNotes = [
  {'language':'en-US','text':''''''}
]

# Declare command-line flags.
argparser = argparse.ArgumentParser(add_help=False)
argparser.add_argument('key_json',
                       help='The key json for ServiceAccountCredentials')
argparser.add_argument('package_name',
                       help='The package name. Example: com.android.sample')
argparser.add_argument('apk_file',
                       nargs='?',
                       default='',
                       help='The path to the APK file to upload.')
argparser.add_argument('draft_name',
                       nargs='?',
                       default=u'最新版',
                       help='草稿名称')
argparser.add_argument('release_note',
                       nargs='?',
                       default='',
                       help='新版说明,默认英文')


def main(argv):
  # Process flags and read their values.
  flags = argparser.parse_args()

  credentials = ServiceAccountCredentials.from_json(flags.key_json)
  http = httplib2.Http()
  http.redirect_codes = http.redirect_codes - {308}
  http = credentials.authorize(http)

  service = build('androidpublisher', 'v3', http=http)


  package_name = flags.package_name
  apk_file = flags.apk_file
  draft_name = flags.draft_name
  release_note = flags.release_note

  try:
      request = service.inappproducts().list(packageName=package_name).execute()
      print(request)

  except client.AccessTokenRefreshError:
    print ('The credentials have been revoked or expired, please re-run the '
           'application to re-authorize')


if __name__ == '__main__':
  main(sys.argv)
