#!/bin/bash

DATA=/data/test/
URL=*.conf
OPT=/opt/
URL1=*.txt

find $DATA/$URL
    if [ $? != 0 ];then
        echo "last exe fail"
        exit 1
    else
        echo "last exe success"	
    fi     


    mv $DATA/$URL $OPT/ && mv $OPT/$URL1 $DATA/
        echo "mv success"
