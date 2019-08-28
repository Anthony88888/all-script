#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		rectangle.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
#x=6
y=4
for i in `seq $y`;do
    for j in `seq $i`;do
        echo -n "#"
    done
    echo 
done
