#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		deny_crack.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
WARNING=10
lastb -f btmp |sed -rn 's/.* (([0-9]{1,3}\.){3}[0-9]{1,3}).*/\1/p' |sort |uniq -c  | while read LINE;do
    TIME=`echo $LINE|cut -d" " -f1`
    IP=`echo $LINE|cut -d" " -f2`
    if [ $TIME -ge $WARNING ];then
        iptables -A INPUT -s $IP -j REJECT
    fi
done
