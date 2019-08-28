#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2018-11-03
#FileName：		yanghui.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2018 All rights reserved
#********************************************************************
#!/bin/sh
if (test -z $1) ;then
    read -p "Input Max Int Lines:" MAX
else
    MAX=$1
fi
for ((i=1;i<=MAX;i++))
do
    for ((j=1;j<=i;j++))
    do
        f=$(($i-1))
        g=$(($j-1))
        if [ "$j" == 1 ];then
            declare SUM_${i}_$j=1
        else
            declare A=$[SUM_${f}_$j]
            declare B=$[SUM_${f}_$g]
            declare SUM_${i}_$j=`expr $A + $B`
        fi
    echo -n $[SUM_${i}_$j]  
    echo -en "  " 
    done
echo  "  " 
done

