#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		fact.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
fact(){
    if [ "$1" -eq 1 ];then 
        echo 1
    else
        echo $[`fact $[$1-1]`*$1]
    fi
}

.  functions 
is_digit $1 
fact $1 



