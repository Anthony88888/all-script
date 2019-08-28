#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		func5.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
func_return(){
    echo func1
    #return
    exit
    echo func2
}

echo 1  func5.sh
func_return
echo 2  func5.sh

