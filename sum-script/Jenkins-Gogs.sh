#!/bin/bash
DATE=`date +%Y-%m-%d_%H-%M-%S`
METHR=$1
GROUP_LIST=$2

function IP_List() {
  if [[ ${GROUP_LIST} == "online-group1" ]];then
  Server_IP="192.168.10.17"
  
  elif [[ ${GROUP_LIST} == "online-group2" ]];then
  Server_IP="192.168.10.27"
  ssh root@192.168.10.18 ""echo enable server webserver/192.168.10.17"  |socat stdio /var/lib/haproxy/haproxy.sock"
  echo "${node} 从192.168.10.18添加成功"
  ssh root@192.168.10.28 ""echo enable server webserver/192.168.10.17"  |socat stdio /var/lib/haproxy/haproxy.sock"
  echo "${node} 从192.168.10.28添加成功"
  
  elif [[ ${GROUP_LIST} == "online-group-all" ]];then
  Server_IP="192.168.10.17 192.168.10.27" 
#  for node in ${GROUP};do
#      echo $node
#done

fi	   
}


function Code_Clone(){
  cd /data/git/linux && rm -rf web1 && git clone gogs@www.tgogst.com:Jenkins/web1.git

}

function make_zip(){
  cd /data/git/linux/web1 && tar czvf testapp.tar.gz ./*
  echo "压缩包打包完毕!"
}

function down_node(){
  for node in ${Server_IP};do
  ssh root@192.168.10.18  "echo disable server webserver/${node}  |socat stdio /var/lib/haproxy/haproxy.sock"
  echo "${node} 从192.168.10.18摘除成功"
  ssh root@192.168.10.28  "echo disable server webserver/${node}  |socat stdio /var/lib/haproxy/haproxy.sock"
  echo "${node} 从192.168.10.28摘除成功"
  done
}

function stop_tomcat(){
  for node in ${Server_IP};do  
    ssh  www@${node} "/etc/init.d/tomcat stop"
  done
}

function start_tomcat(){
  for node in ${Server_IP};do
    ssh www@${node} "/etc/init.d/tomcat start"
  done
}

function scp_codefile(){
  cd /data/git/linux/web1/
  Dir_Name=/data/tomcat/tomcat_webdir/testapp-${DATE}
  Web_Dir=/data/tomcat/webapps/testapp
  APP_Name=/data/tomcat/tomcat_appdir/testapp-${DATE}.tar.gz
  for node in ${Server_IP};do
  scp  testapp.tar.gz www@${node}:${APP_Name}
  ssh www@${node} "mkdir ${Dir_Name} && tar vxf ${APP_Name} -C ${Dir_Name} && rm -rf ${Web_Dir} && ln -sv ${Dir_Name} ${Web_Dir}" 
  done
}

function web_test(){
#sleep 30
for node in ${Server_IP};do
  NUM=`curl -s -I -m 10 -o /dev/null -w %{http_code} ${node}:8080/testapp/index.html`
  if [[ ${NUM} -eq 200 ]];then
      echo "${node} 测试通过,即将添加到负载"
      add_node ${node}
  else
      echo "${node} 测试失败,请检测该服务器是否成功启动tomcat"
  fi
done  
}

function add_node(){
  node=$1
    echo ${node},"---->"
    if [ ${node} == "192.168.10.17" ];then
      echo "192.168.10.17部署完毕,请进行测试代码!"
    else
    ssh root@192.168.10.18  "echo enable server webserver/${node}  |socat stdio /var/lib/haproxy/haproxy.sock"
      echo "${node} 从192.168.10.18添加成功"
    ssh root@192.168.10.28  "echo enable server webserver/${node}  |socat stdio /var/lib/haproxy/haproxy.sock"
      echo "${node} 从192.168.10.28添加成功"
    fi         
}

function rollback_last_version(){
  for node in ${Server_IP};do
    NOW_VERSION=`ssh www@${node} ""/bin/ls -l -rt /data/tomcat/webapps/ |awk -F"->" '{print $2}' | tail -n1 |awk -F "/data/tomcat/tomcat_webdir/" '{print $2}'""`
      echo ${NOW_VERSION}
    NAME=`ssh  www@${node} ""/bin/ls -l -rt -d /data/tomcat/tomcat_webdir/testapp* | grep -B 1 ${NOW_VERSION} | head -n1 | awk '{print $9}' ""`
    ssh www@${node} "rm -rf /data/tomcat/webapps/testapp && ln -sv ${NAME} /data/tomcat/webapps/testapp"
done
}

function delete_history_version(){
for node in ${Server_IP};do
  NUM=`ssh www@${node} ""/bin/ls -l -rt -d /data/tomcat/tomcat_webdir/testapp* | wc -l""`
  if [ ${NUM} -gt 8 ];then
  delete_name=`ssh www@${node} ""/bin/ls -l -rt -d /data/tomcat/tomcat_webdir/testapp* |head -n1 |awk '{print $9}' ""`
  ssh www@${node} "rm -rf ${delete_name}"
  echo "${node} 成功删除${delete_name}"
  fi
done
}

main(){
    case ${METHR} in
       deploy)
         IP_List; 
         Code_Clone;
         make_zip;
         down_node;
         stop_tomcat;
         scp_codefile;
         start_tomcat;
         web_test;
         delete_history_version;		 	 
        ;;
	rollback_last_version)
          IP_List;
          #echo ${Server_IP}
	  down_node;
 	  stop_tomcat;
          rollback_last_version;
	  start_tomcat;
	  web_test;
	   ;;

       esac  		  
}	

main $1 $2 $3
