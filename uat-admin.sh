#!/bin/bash
#Author Curry

#IT3生产环境包更新脚本,ZIP的压缩包在外面的时候,就设置为统一的名称,方面下面调用变量,统一修改更新包名(Dist-production.zip)!
#scp -P 12399  "$AD-$DATE"  node1:/data/admin/   默认端口不是22请根据实际生产情况
#此脚本初始化跑的时候必须跑两次才可以同步服务器的连接内容,后续会进一步完善.
#此脚本前期测试是否能正常按照预期的同步服务器的包组,后期打开注释的参数即可实现同步更新线上发布内容!

DATE=`date +%Y-%m-%d_%H-%M-%S`
PPP=/data/admin/
HISTORY_PWD=/opt/hs_admin
result_name=dist
AD=admin
ZIP=Dist-production.zip
RT=/root/
ND=192.168.18.73
PORT=12399
#-------------------------------------------------分割线---------------------------------------------------#
echo "NO.1---请确认是否放置在生产环境中使用,如果不是生产环境,请立即退出,犹豫时间10秒!!!!!!---" && sleep 10
echo "执行解压缩步骤!"
unzip $ZIP -d $HISTORY_PWD
if [ ! -d "$HISTORY_PWD" ]; then
    mkdir $HISTORY_PWD     
fi    

if [ ! -d $HISTORY_PWD/$result_name ];then
    exit 1
else
    echo "稍等片刻,准备执行后续操作！"    
fi

cd $HISTORY_PWD && mv $result_name  "$AD-$DATE" && ln -snf  "$HISTORY_PWD/$AD-$DATE"  "$PPP/$AD"
#cd $HISTORY_PWD && mv $result_name  "$AD-$DATE" 


if [ $? = 0 ];then
    echo "生产环境包更新成功!" && rm -rf "$RT/$ZIP" && sleep 5
else
    echo "生产环境包更新失败,请确认检查!" && exit 1
fi

#-------------------------------------------------分割线---------------------------------------------------#
echo "NO.2---拷贝需要更新的包到另外一台服务器,更新完成请验证文件是否一致!"  
SC=`/bin/ls -l -rt /opt/hs_admin/ |awk '{print $9}'|tail -n1 |awk '{sub(/^[ \t]+/,"");print $0}'`
if [ ! -d "$HISTORY_PWD" ]; then
    mkdir $HISTORY_PWD 
fi
scp -P $PORT -r "$SC"  $ND:$HISTORY_PWD >/dev/null 

if [ $? = 0 ];then
   ssh -p $PORT $ND  ln -snf "$SC" $PPP/$AD  && echo "同步到另外一台服务器成功!"
else
    echo "同步到另外一台服务器失败!" && exit 1
fi

#-------------------------------------------------分割线---------------------------------------------------#
echo "NO.3---历史版本删除中,请耐心等待!---" && sleep 5
NUM=`/bin/ls -l -rt -d /opt/hs_admin/* | wc -l`
if [  ${NUM} -gt 3 ];then
   delete_name=`/bin/ls -l  -rt -d /opt/hs_admin/* |head -n1 | awk '{print $9}'`
   rm -rf ${delete_name} && ssh -p $PORT $ND "rm -rf ${delete_name}"
   echo "成功删除${delete_name}"
fi