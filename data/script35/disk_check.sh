#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		disk_check.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
WARNING=10
df|grep "^/dev/sd" | while read LINE;do
    USED=`echo $LINE|sed -rn 's/^([^[:space:]]+).* ([0-9]+)%.*/\2/p'`
    PART=`echo $LINE|sed -rn 's/^([^[:space:]]+).* ([0-9]+)%.*/\1/p'`
    if [ $USED -ge $WARNING ];then
        echo "$PART Will be full,used:$USED"
    fi
done
