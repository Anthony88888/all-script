#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		trap.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
trap 'echo press ctrl+c,but no exit'  2
trap -p 
for ((i=0;i<10;i++));do
    echo i=$i
    sleep 0.5
done

trap ''  2
trap -p 
for ((i=10;i<20;i++));do
    echo i=$i
    sleep 0.5
done

trap '-'  2
trap -p 
for ((i=20;i<30;i++));do
    echo i=$i
    sleep 0.5
done
