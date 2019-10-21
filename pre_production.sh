#!/bin/bash
#Author Curry

#IT3预生产环境包更新脚本,ZIP的压缩包在外面的时候,就设置为统一的名称,方面下面调用变量!
#此脚本后续会完善删除历史版本的内容,请耐心等待!!!!!
DATE=`date +%Y-%m-%d_%H-%M-%S`
PWD=/home
result_name=dist
AD=admin
ZIP=Dist-Pre-production.zip
RT=/root/


echo "---请确认是否放置在预生产环境中使用,如果不是预生产环境,请立即退出,犹豫时间10秒!!!!!!---" && sleep 10
echo "No.1..执行解压缩步骤!"
unzip $ZIP -d $PWD

if [ ! -d $PWD/$result_name ];then
    exit 1
else
    sleep 2 && echo "骚等片刻,准备执行后续操作！"    
fi

cd $PWD && mv $result_name  "$AD-$DATE" && ln -snf  "$AD-$DATE" $AD 
sleep 2 

if [ $? = 0 ];then
    echo "预生产环境包更新成功!" && rm -rf "$RT/$ZIP"
else
    echo "预生产环境包更新失败,请确认检查!" && exit 1
fi
