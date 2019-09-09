#!/bin/bash

DATA=/data/test/
URL=*.conf
OPT=/opt/
URL1=*.txt

find $DATA/$URL1
    if [ $? != 0 ];then
        echo "last exe fail"
        exit 1
    else
        echo "last exe success" 
    fi


    mv $DATA/$URL1 $OPT/ && mv $OPT/$URL $DATA/
        echo "mv success"
