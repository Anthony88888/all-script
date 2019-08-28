#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-11
#FileName：		test_select.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
PS3="Please choose the menu(1-5): "
select menu in baoyu longxia bjky haishen quit;do
    case $menu in
    baoyu)
        echo $menu price is 100
        ;;
    longxia)
        echo $menu price is 60
        ;;
    bjky)
        echo $menu price is 200
        ;;
    haishen)
        echo $menu price is 30
        ;;
    *)
        break
    esac
done
