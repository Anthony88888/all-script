#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		sum.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
read -p "Please input a number: " NUM
[[ $NUM =~ ^[1-9][0-9]*$ ]] || { echo "INput false " ; exit; }

for(( SUM=0,i=1;i<=NUM;i++ ));do
    let SUM+=i
done
echo sum=$SUM
