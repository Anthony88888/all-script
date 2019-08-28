#!/bin/bash
#this is auto creat
#version:1.0
#author:zhlz 
#Date: 2017-03-25
#input the file path
for i in {1..10}
do
	case $i in
		5)
			for j in {1..15}
			do
				case $j in
					5)
						echo -e "\033[33;41m☆ \033[0m\c"
						;;
					*)
						echo -e  "\033[41m  \033[0m\c"
				esac
			
			done
			;;
		2)
		for j in {1..15}
		do
				case $j in
#					3)
#						echo -e "\033[33;41m☆ \\033[0m\c"
#						;;
					5)
						echo -e "\033[33;41m☆ \\033[0m\c"
						;;
					*)
						echo -e  "\033[41m  \033[0m\c"
				esac
		done
			;;
			
		3)
		for j in {1..15}
		do
				case $j in
#					2)
#						echo -e "\033[33;41m☆ \033[0m\c"
#						;;
					3)
						echo -e "\033[33;41m☆ \033[0m\c"
						;;	
#					4)
#						echo -e "\033[33;41m☆ \033[0m\c"
#						;;
					6)
						echo -e "\033[33;41m☆ \033[0m\c"
						;;
					*)
						echo -e  "\033[41m  \033[0m\c"
				esac
		done
			;;
		4)
		for j in {1..15}
		do
				case $j in
					6)
						echo -e "\033[33;41m☆ \033[0m\c"
						;;
#					3)
#						echo -e "\033[33;41m☆ \033[0m\c"
#						;;
					*)
						echo -e  "\033[41m  \033[0m\c"
				esac
		done
			;;
		*)

				for j in {1..15}
		do
			echo -e  "\033[41m  \033[0m\c"
		done
	esac
	echo
done
