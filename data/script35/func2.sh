#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		func2.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
.  functions
VER=`os_version`

if [ "$VER" -eq 7 ];then
    systemctl restart sshd 
    systemctl status sshd
else
    service sshd restart
    service sshd status
fi
