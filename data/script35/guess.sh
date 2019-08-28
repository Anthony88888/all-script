#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		guess.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
NUM=$[RANDOM%11]
while read -p "please guess a digit(0-10): " N ;do
    if [ "$NUM" -eq "$N" ];then
        echo "You are OK"
        break 
    elif  [ "$NUM" -lt "$N" ];then
        echo "too bigger"
    else
        echo "too small"
    fi
done
