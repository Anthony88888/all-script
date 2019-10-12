#!/bin/bash
#Author: curry
#Date: 2019-10-11
#参考博客: https://www.cnblogs.com/nulige/articles/8469929.html
#          http://www.openskill.cn/article/182
#          https://www.cnblogs.com/lr-ting/archive/2013/02/28/2936792.html


echo "第1步----->请输入(expect)的安装包,否则无法继续进行!"
read -p "请输入正确的安装包名称(expect):" m
epacket=`yum list installed | grep $m |wc -l`
if [ "$epacket" -ne "0" ];then
    echo "非常遗憾的告知您,此包已经安装过!" 
else
    yum -y install expect \
    && echo "已成功安装expect包!"
fi


sleep 2 
echo "第2步----->清空之前的秘钥,重新自动生成公私钥,并且准备拷贝到生产中的节点!"
rm -rf ~/.ssh/{known_hosts,id_rsa*}
set timeout 30
/usr/bin/expect << EOF
spawn ssh-keygen -t rsa 
expect {
"Enter file in which to save the key (/root/.ssh/id_rsa):" { send "\r"; exp_continue}
"Enter passphrase (empty for no passphrase):" { send "\r"; exp_continue} 
"Enter same passphrase again:" { send "\r"; exp_continue}
}
interact
EOF


sleep 2
echo "第3步----->基于免密的方式,批量分发公钥到其余节点,以及修改主机名和hosts解析!"
export USER=root
export SNAMEPRE=node
export PASSWD=7777

for i in 1 ; do
  /usr/bin/expect << EOF
spawn ssh-copy-id -i /root/.ssh/id_rsa.pub $USER@$SNAMEPRE$i 
expect {
"(yes/no)?" {send "yes\r";exp_continue}
"password:" {send "$PASSWD\r"}
}
interact
expect eof
EOF

    scp /etc/hosts $USER@$SNAMEPRE$i:/etc/hosts > /dev/null
    ssh $USER@$SNAMEPRE$i "sed -i s/^.*/$SNAMEPRE$i/ /etc/hostname; hostname $SNAMEPRE$i"
done;


for num in {5..1};do
  sleep 1 &&  echo -en "\033[37m \n$num \033[0m"
done;
echo -e "\n---------------------------------------------------------------------------------------"
echo "初始化主机名和hosts配置成功,请登录各node节点服务器,输入命令exit退出后再次重新连接服务器!"
