#!/bin/bash
#
#********************************************************************
#Author:		ZhangHan
#QQ: 			9345831
#Date: 			2018-10-29
#FileName：		yanhuisanjiao.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2018 All rights reserved
#********************************************************************
read -p "输入高度" g  #g是最高行
declare -a a
for i in `seq $g` # $i是当前行
do
	if [ $i -eq 1 ]
	then
		for o in `seq $[$g-$i]`
		do
			echo -n "   "
		done
		a[1]=1
		echo  "1"
		continue
	fi
	for j in `seq $i` #j表示当前行的第几个数字
	do              
		if [ $j -eq 1 ]
		then
			for o in `seq $[$g-$i]`
			do
				echo -n "   "
			done
			echo -n "1"
			a[$i$j]=1
		elif [ $j -eq $i ]
		then
			echo -n "     1"
			a[$i$j]=1
		else
			let  a[$i$j]=${a[$[i-1]$[j-1]]}+${a[$[i-1]$[j]]}
			echo -n "     ${a[$i$j]}"

		fi
	done
echo
done		
