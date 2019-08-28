#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		trap_exit.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
finish(){
    rm -rf /data/tmp/*
    echo finish
}
trap finish EXIT

touch /data/tmp/f1
touch /data/tmp/f2

sleep 20

rm -rf /data/tmp/*
