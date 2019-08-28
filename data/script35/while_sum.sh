#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		while_sum.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
SUM=0
i=1
while [ $i -le 100 ];do
    let SUM+=i
    let i++
done
echo sum=$SUM
