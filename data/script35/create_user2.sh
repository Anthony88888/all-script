#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		create_user2.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
USERS="
xiaoming
xiaohong
xiaoqiang
laowang
"
for USER  in $USERS ;do
    if id ${USER} &> /dev/null ;then
        echo "用户:${USER} 已存在，创建失败"
    else
        useradd ${USER}
        echo ${USER}  | passwd --stdin ${USER}  &> /dev/null
        echo "用户:${USER} 创建成功"
    fi
done
