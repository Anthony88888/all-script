#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		is_digit.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
is_digit(){
    read -p "Please input a number: " NUM
    [[ $NUM =~ ^[1-9][0-9]*$ ]] || { echo "Input false " ; exit; }
}
NUM=100
is_digit

echo Num=$NUM
