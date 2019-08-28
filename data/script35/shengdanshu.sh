#!/bin/bash
#this is auto creat
#version:1.0
#author:zhlz 
#Date: 2017-03-24
#read -p "三角树头高度几层: " Lines
#read -p "输入要几层圣诞树 : " Quens
#read -p "输入根的层数： " Gen
Lines=10
Quens=3
Gen=3
#树头
for L_Num in `seq 1 $Lines`
do
	A_Num=$[$L_Num*2-1]
	S_Num=$[$Lines-$L_Num]
#左
	Pil=$[$Lines-1]
	for h in `seq 1 $Pil`
		do
			QQ=$[$RANDOM%5]
			case $QQ in
				2)
					echo -e "\033[37m❄\033[0m\c"
					;;
				*)
					echo -e " \c"
			esac
		done
	for i in `seq 1 $S_Num`
		do
#
			
				echo -e " \c"
		done
#中
	for j in `seq 1 $A_Num`
		do
#添加铃铛

			QQ=$[$RANDOM%16]
			Yan=$[$RANDOM%7]
			case $QQ in
				2)
					echo -e "\033[3$Yan;5m♥\033[0m\c"
					;;
				*)
				echo -e "\033[32;1mA\033[0m\c"
			esac
		done
#right
	for k in `seq 1 $S_Num`
		do
			QQ=$[$RANDOM%5]
			case $QQ in
				2)
					echo -e "\033[37m❄\033[0m\c"
					;;
				*)
					echo -e " \c"
			esac
		done
	echo 
done 
#树中
#插入层数
for n in `seq 1 $Quens`
do
	nnn=$[$n+1]
	for L_Num in `seq $nnn $Lines`
	do
		A_Num=$[$L_Num*4-1]
		S_Num=$[$Lines*2-1-$L_Num*2]
		for i in `seq 1 $S_Num`
			do
#插入彩条
			if [ $L_Num -eq $nnn -a $n -gt 1 ];then
		 		Cai=$[$RANDOM%3]
				Yan=$[$RANDOM%7]
				[ $Cai -eq 0 ] && echo -e "\033[3$Yan;5m|\033[0m\c" ||  echo -e " \c"
			else	
					QQ=$[$RANDOM%5]
					case $QQ in
						2)
							echo -e "\033[37m❄\033[0m\c"
							;;
						*)
							echo -e " \c"
			esac
			fi
			done
		for j in `seq 1 $A_Num`
			do
#添加铃铛
				QQ=$[$RANDOM%15]
				Yan=$[$RANDOM%7]
				case $QQ in
				2)
					echo -e "\033[3$Yan;5m♥\033[0m\c"
					;;
				*)
					echo -e "\033[32;1mA\033[0m\c"
				esac
			done
		for k in `seq 1 $S_Num`
			do
			if [ $L_Num -eq $nnn -a $n -gt 1 ];then
		 		Cai=$[$RANDOM%3]
				Yan=$[$RANDOM%7]
				[ $Cai -eq 0 ] && echo -e "\033[3$Yan;5m|\033[0m\c" || echo -e " \c"
				else
					QQ=$[$RANDOM%5]
					case $QQ in
						2)
							echo -e "\033[37m❄\033[0m\c"
							;;
						*)
							echo -e " \c"
			esac

			fi
			done
		echo 
	done 
done
for b in `seq 1 $Gen`
do
		LLines=$[$Lines*2-4]
	for q in `seq 1 $LLines`
		do
			echo -e " \c"
		done
	for p in {1..5}
		do
			echo -e "\033[40mH\033[0m\c"
		done
	echo 
done
