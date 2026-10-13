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

  credentials = ServiceAccountCredentials.from_json_keyfile_name(flags.key_json,
      scopes=['https://www.googleapis.com/auth/androidpublisher'])
  http = httplib2.Http()
  http.redirect_codes = http.redirect_codes - {308}
  http = credentials.authorize(http)

  service = build('androidpublisher', 'v3', http=http)


  package_name = flags.package_name
  apk_file = flags.apk_file
  draft_name = flags.draft_name
  release_note = flags.release_note

  try:
    edit_request = service.edits().insert(body={}, packageName=package_name)
    result = edit_request.execute()
    edit_id = result['id']

    aabMedia = MediaFileUpload(apk_file,chunksize=1024*1024, resumable=True)

    request = service.edits().bundles().upload(
            editId=edit_id,
            ackBundleInstallationWarning=True,
            packageName=package_name,
            media_body=aabMedia)

    response = None
    tags = ['—','\\','|','/']
    while response is None:
        status, response = request.next_chunk()
        if status:
            pro = int(status.progress() * 100)
            out_string = "\r[%s]%3d%%|%s| %s/100" %(tags[(pro-1)%4], pro, "█" * (pro // 2), pro)
            sys.stdout.write(out_string)
            sys.stdout.flush()
        else:
            print(status)
            print(response)
            break

    print(response)
    print('Version code %d has been uploaded' % response['versionCode'])

    commit_request = service.edits().commit(
        editId=edit_id, packageName=package_name).execute()
    
    print(commit_request)

  except client.AccessTokenRefreshError:
    print ('The credentials have been revoked or expired, please re-run the '
           'application to re-authorize')

  len1 = len(release_note)
  print('<---Translate start--->%s'% len1)
  if len1 > 0:
    print('<---Translate releaseNotes...--->')
    for note in releaseNotes:
        if len(note['text']) > 0:
            continue
        if note['language'].startswith('en'):
            note['text'] = release_note
        textLen = len(note['text'])
        if textLen > 500:
            print(f"Language {note['language']} with length {textLen}, which is too long (max: 500).")
            exit(0)
    print(releaseNotes)

    edit_request = service.edits().insert(body={}, packageName=package_name)
    result = edit_request.execute()
    edit_id = result['id']

    track_response = service.edits().tracks().update(
        editId=edit_id,
        track=TRACK,
        packageName=package_name,
        body={u'releases': [{
            u'name': u'%s draft' % draft_name,
            u'versionCodes': [response['versionCode']],
            u'status': u'draft',
            u'releaseNotes':releaseNotes
        }]}).execute()

    print('Track %s is set with releases: %s' % (track_response['track'], str(track_response['releases'])))

    commit_request = service.edits().commit(
        editId=edit_id, packageName=package_name).execute()

    print('Releasenotes has been committed')

    

if __name__ == '__main__':
  main(sys.argv)
