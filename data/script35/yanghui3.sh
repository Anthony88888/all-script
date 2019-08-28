#!/bin/bash
#
#********************************************************************
#Author:		M30
#********************************************************************
yanghui(){
    tmp=$1
    i=0
    while [ $i -ne `expr $tmp + 1` ]
    do
        if [ $i -eq $tmp ]||[ $i -eq 0 ]
        then
            echo -n 1
        else
            echo -n $(expr $2 + $3)
            shift
        fi
        echo -n " "
        i=`expr $i + 1`
    done


}
yanghuibegin(){
if [ $# -ne 1 ]
then
   read -p  "请输入行数:"  COUNT
else
    COUNT=$1
fi
i=0
while [ $i -ne  $COUNT ]
do
    tmp=(`yanghui $i ${tmp[*]}`)
    echo ${tmp[*]}
    i=`expr $i + 1`
done
unset tmp
}
yanghuibegin
