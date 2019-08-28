#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		test_shift.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while true;do
    [ -z "$1" ] && exit
    if id $1 &> /dev/null;then
        echo "$1 is exist"
    else
        useradd $1
        echo "$1 is created"
    fi
    shift
done
