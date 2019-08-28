#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		monitor_httpd.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while true;do
    if killall -0 httpd &> /dev/null ;then 
        true
    else
        systemctl restart httpd
        echo at `date +"%F %T"` >> /data/moitor_httpd.log
    fi
    sleep 30
done
