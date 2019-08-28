#!/bin/bash
#Author:wang
#Date:2017-07-03
red(){
	echo -e "\033[41m        \033[0m\c"
}
yel(){
	echo -e "\033[43m        \033[0m\c"	
}
redyel(){
	for ((i=1;i<=4;i++));do
		for ((j=1;j<=4;j++));do
			[ "$1" = "-r" ] && { yel;red; } || { red;yel; }
		done
		echo
	done
}
for ((line=1;line<=8;line++));do
	[ $[$line%2] -eq 0 ] && redyel || redyel -r
done
