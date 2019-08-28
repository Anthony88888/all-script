#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		scan_host.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
NET=172.20.119

START=1
END=254

for HOSTID in `seq $START $END`;do
    {
    if ping -c1 -W1 ${NET}.${HOSTID} &> /dev/null ;then
        echo ${NET}.${HOSTID} is up
        echo ${NET}.${HOSTID} >> hostlist.txt
    else
        echo ${NET}.${HOSTID} is down
    fi
    }&
done
wait
