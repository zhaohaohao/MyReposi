#! /usr/bin/env python
# build.py
#-*- encoding:utf-8 -*-
#author: zhangjinming
#date: 2017-01-07 17:10

import os
import sys
import time

g_vc_file = 'app/src/main/AndroidManifest.xml'
g_build_file= 'app/src/main/java/com/anbang/bbchat/build/Version.java'
g_build_type_file='mcommon/src/main/java/com/anbang/bbchat/mcommon/utils/BuildType.java'
g_vn_key = 'android:versionName'
g_vc_key = 'android:versionCode'
g_build_key = 'BUILD_NUMBER'
g_build_type_key = 'DEBUG ='

# build + 1, set debug
def accBuild():
    if len(sys.argv) < 5:
        return

    BUILD_TYPE = sys.argv[3]
    BRANCH_NAME = sys.argv[4]
    print 'BRANCH_NAME=' + BRANCH_NAME

    os.system("git checkout " + BRANCH_NAME)
    os.system("git checkout .")
    os.system("git pull origin " + BRANCH_NAME)

def preBuild(type):
    print 'preBuild type=' + type

    #chmod
    os.system('chmod +x gradlew')
    os.system('chmod +x build.py')
    #os.system('chmod +x mk.sh')

    #plugins build
    #os.system("python build-plugins.py " + type)

    #prebuild
    os.system('./gradlew clean')

    if type == 'debug':
        os.system('./gradlew assembleDebug')
    if type == 'release':
        os.system('./gradlew assembleRelease')

def excute():
    accBuild()

    JOB_NAME = sys.argv[1]
    BUILD_ID = sys.argv[2]
    BUILD_TYPE = sys.argv[3]
    BUILD_YMD = time.strftime("%Y%m%d%H%M%S")

    #pre build
    preBuild(BUILD_TYPE)

if __name__ == "__main__":
    excute()
