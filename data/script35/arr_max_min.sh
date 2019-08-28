#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		arr_max_min.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
declare -a RAND

for((i=0;i<10;i++));do
    RAND[$i]=$RANDOM
    if [ $i -eq 0 ];then
        MAX=${RAND[$i]}
        MIN=${RAND[$i]}
    else 
        [  ${RAND[$i]} -gt $MAX ] && MAX=${RAND[$i]}
        [  ${RAND[$i]} -lt $MIN ] && MIN=${RAND[$i]}
    fi 
done
echo all random is ${RAND[*]}
echo max=$MAX
echo min=$MIN
