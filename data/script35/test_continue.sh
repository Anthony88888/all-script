#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		test_continue.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
for((i=0;i<3;i++));do
    for((j=0;j<3;j++));do
        if [ $j -eq 1 ];then continue;fi
        echo j=$j
    done
done
