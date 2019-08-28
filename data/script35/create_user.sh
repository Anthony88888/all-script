#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		create_user.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
USER=user
for i in {1..10};do
    if id ${USER}${i} &> /dev/null ;then
        echo "用户:${USER}${i} 已存在，创建失败"
        continue
    else
        useradd ${USER}${i} 
        echo ${USER}${i}  | passwd --stdin ${USER}${i}  &> /dev/null
    fi
    echo "用户:${USER}${i} 创建成功"
done
