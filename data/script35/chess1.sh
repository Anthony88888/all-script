#!/bin/bash

for i in {1..8};do
        temp1=$[ $i % 2 ]

        for j in {1..8};do
        temp2=$[ $j % 2 ]

        if [ $temp1 -eq  $temp2  ];then
                echo -e -n "\033[47m  \033[0m"
        else
                echo -e -n "\033[41m  \033[0m"
        fi

        done

        echo 
done
