#!/bin/bash
ColorDisplay(){
	if [ $1 == GREEN ];then
		echo -e "\033[1;32m$2\033[0m"
	fi
	if [ $1 == RED ];then
		echo -e "\033[1;31m$2\033[0m"
	fi
}
for ((i=1;i<=$1;i++)); do
	for ((j=$1-i;j>=1;j--)); do
			echo -e ' \c'
	done
	for ((k=1;k<=2*i-1;++k)); do
		declare -i N=$(($RANDOM%7+30))
		if [[ $N -gt 31 && $N -lt 37 ]];then
			echo -e "\033[1;${N}m*\c\0mm"
		else
			echo -e "\033[32m*\c\0mm"
		fi
		if [ $k -eq $( expr $i \* 2 - 1 ) ]; then
			echo
		fi
	done
done

