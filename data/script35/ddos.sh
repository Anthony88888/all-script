#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		ddos.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
WARNING=3
ss -nt|sed -rn  '/ESTAB/s#.* (.*):.*$#\1#p'|sort |uniq -c |while read LINE;do
    TIME=`echo $LINE|cut -d" " -f1`
    IP=`echo $LINE|cut -d" " -f2`
    if [ $TIME -ge $WARNING ];then
        iptables -A INPUT -s $IP -j REJECT
    fi
done
