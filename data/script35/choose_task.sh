#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		choose_task.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
PS3="Please choose a task: "
select task in backup clean restore quit;do
    case $task in 
    backup)
        ./backup.sh
        ;;
    clean)
        ./clean.sh
        ;;
    restore)
        ./restore.sh
        ;;
    *)
        break
    esac
done
