#!/bin/bash
#Author Curry

#IT3生产环境包更新脚本,ZIP的压缩包在外面的时候,就设置为统一的名称,方面下面调用变量!
#此脚本后续会完善删除历史版本的内容,请耐心等待!!!!!
#scp -P 12399  "$AD-$DATE"  node1:/data/admin/   默认端口不是22请根据实际生产情况

DATE=`date +%Y-%m-%d_%H-%M-%S`
PWD=/data/admin/
result_name=dist
AD=admin
ZIP=Dist-production.zip
RT=/root/
ND=node1

#-------------------------------------------------分割线---------------------------------------------------#
echo "NO.1---请确认是否放置在生产环境中使用,如果不是生产环境,请立即退出,犹豫时间10秒!!!!!!---" && sleep 10
echo "执行解压缩步骤!"
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

#-------------------------------------------------分割线---------------------------------------------------#
echo "NO.2---拷贝需要更新的包到另外一台服务器,更新完成请验证文件是否一致!"  && sleep 5

SC=`/bin/ls -l -rt /data/admin/ |awk -F"->" '{print $2}'|tail -n1 |awk '{sub(/^[ \t]+/,"");print $0}'`
scp -r "$PWD/$SC"  $ND:$PWD >/dev/null 

if [ $? = 0 ];then
    ssh $ND ln -snf "$PWD/$SC $PWD/$AD"  && echo "同步到另外一台服务器成功!"
else
    echo "同步到另外一台服务器失败!" && exit 1
fi
