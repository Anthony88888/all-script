-----------------优化系统脚本-------------------



[root@all-kjw ~]# cat system.sh 
#############################################################
# File Name: system.sh
# Author: robin
# Created Time: Fri 18 Oct 2018 05:01:02 PM CST
#==================================================================
#!/bin/sh
# 运行环境CentOS 7.x

echo "判断centos7还是centos6系统"
sleep 1
VERSION=`cat /etc/redhat-release|awk -F " " '{print $3}'|awk -F "." '{print $1}'`
if [ "$VERSION" == "6" ];then
VERSION='6'
echo "centos6"
else
VERSION='7'
echo "centos7"
fi

echo "查看内存 cpu 硬盘大小"
sleep 1
MEM=`free -m`
#4.1查看物理CPU个数
physical_id=`cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l`
#4.2查看每个物理CPU中core的个数(即核数)
cpu_cores=`cat /proc/cpuinfo| grep "cpu cores"| uniq`
#4.3查看逻辑CPU的个数
processor=`cat /proc/cpuinfo| grep "processor"| wc -l`
echo "$MEM"
echo "####################################################"
echo "cpu物理个数 physical_id:          $physical_id"
echo "每个cpu中core的个数(即核数)       $cpu_cores"
echo "逻辑cpu的个数 processor:          $processor"
echo "####################################################"
#4.4硬盘大小
disk=`df -Th`
echo "$disk"

echo "下载wget，请稍后·······"
yum -y install wget   &>/dev/null

echo "添加DNS地址，请稍等....... "
cat >> /etc/resolv.conf << EOF
nameserver 114.114.114.114 
nameserver 114.114.114.114 
EOF

echo "是否换成阿里云的的源 "
echo "等待3秒:"
sleep 3
cat << EOF
        **********************
        1.[change aliyuan]
        2.[no change aliyuan]
        3.[exit]
    pls input the num you want:
        **********************
EOF
read -t 30 -p "pls input the num you want:" a
[ -n "`echo $a|sed 's#[0-9]##g'`" ] && {
         echo "Input error"
        exit 1
}
iffuncation(){
if [ $a -eq 1 ];then
        echo "change aliyuan"
        echo "等待3S"
        sleep 3
        mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup   &>/dev/null
        if [ "$VERSION" == "7" ];then
        wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo   &>/dev/null
        else
        wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo   &>/dev/null
        fi
        yum clean all    &>/dev/null
        yum makecache    &>/dev/null
        echo "等待3S" 
        sleep 3
elif [ $a -eq 2 ];then
        echo "no change aliyuan"
elif [ $a -eq 3 ];then
        exit 1
else
        echo "Input error"
        exit 1
fi
}
iffuncation

echo "下载必要的初始化的工具"
        sleep 3
        yum -y install net-tools tree nmap lrzsz dos2unix telnet screen vim lsof wget ntp rsync   &>/dev/null

echo "修改ip和主机名的对应关系 /etc/hosts"
        sleep 3
cat > /etc/hosts << EOF
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
EOF
if [ "$VERSION" == "7" ];then
        echo "`ifconfig|sed -n '2p'|awk -F " " '{print $2}'` $HOSTNAME" >> /etc/hosts
else
        echo "`ifconfig|sed -n '2p'|awk -F " " '{print $2}'|awk -F ":" '{print $2}'` $HOSTNAME" >> /etc/hosts
fi

echo "查看时间 并设置初始化时间"
date +%F\ %T
ntpdate cn.pool.ntp.org && hwclock -w

echo "命令补全,请稍等....... "
yum install bash-completion -y &>/dev/null

echo "/设置linux的最大文件打开数"
ulimit -SHn 65535
ulimit -a
if [ "`egrep "* - nofile 65535|* - nproc 65536" /etc/security/limits.conf|wc -l`" == "0" ];then
        echo "* - nofile 65535" >> /etc/security/limits.conf
        echo "* - nproc 65536" >> /etc/security/limits.conf
else
        echo "linux的最大文件打开数 设置成功或者之前已经设置过了"
fi
sleep 2

echo "禁用selinux,请稍等......."
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
setenforce 0

echo "关闭防火墙,请稍等......."
systemctl disable firewalld.service   &>/dev/null
systemctl stop firewalld.service

echo "优化ssh服务,请稍等......."
sed -i 's/^GSSAPIAuthentication yes$/GSSAPIAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
systemctl restart sshd.service

echo "-------<内核参数优化>-------"
cat >> /etc/sysctl.conf << EOF
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv4.ip_forward = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.tcp_sack = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_rmem = 4096 87380 4194304
net.ipv4.tcp_wmem = 4096 16384 4194304
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.core.netdev_max_backlog = 262144
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_fin_timeout = 1
net.ipv4.tcp_keepalive_time = 30
#net.ipv4.ip_local_port_range = 1024 65000
fs.file-max = 265535
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
vm.swappiness = 10

EOF
/sbin/sysctl -p
echo "系统已优化完毕，请使用！"


















#数据库相关配置
#mysql 相关优化参数配置  
[root@all-kjw data]# cat /etc/my.cnf

[client]
port	= 3306
socket	= /data/mysql/data/mysql3306.sock

[mysql]
prompt="\u@MariaDB \R:\m [\d]> "
no-auto-rehash

[mysqld]
server-id = 513306
user	= mysql
port	= 3306
basedir	= /usr/local/mysql
datadir	= /data/mysql
socket	= /data/mysql/data/mysql3306.sock
##数据库错误日志文件
log-error = /data/mysql/data/error.log
pid-file = mysqldb.pid
character-set-server = utf8
skip_name_resolve = 1

#若你的MySQL数据库主要运行在境外，请务必根据实际情况调整本参数
default_time_zone = "+8:00"

open_files_limit    = 65535
back_log = 1024
max_connections = 512
max_connect_errors = 1000000
interactive_timeout = 600
wait_timeout = 600
tmp_table_size = 32M
max_heap_table_size = 32M

##日志设置
slow_query_log = 1
slow_query_log_file = /data/mysql/logs/slow.log
long_query_time = 1
log_queries_not_using_indexes =1
min_examined_row_limit = 100
log_slow_admin_statements = 1
log_slow_slave_statements = 1


log-bin = /data/mysql/logs/mybinlog
sync_binlog = 1
binlog_cache_size = 4M
max_binlog_cache_size = 2G
max_binlog_size = 1G
log_slave_updates

innodb_thread_concurrency = 0
innodb_sync_spin_loops = 100
innodb_spin_wait_delay = 30

transaction_isolation = REPEATABLE-READ
#innodb_additional_mem_pool_size = 16M
innodb_buffer_pool_size = 45875M
innodb_buffer_pool_instances = 4
innodb_flush_log_at_trx_commit = 1
innodb_log_files_in_group = 2


# some var for MySQL 5.7
innodb_checksums = 1
#innodb_file_format = Barracuda
#innodb_file_format_max = Barracuda
query_cache_size = 0
query_cache_type = 0


[mysqldump]
quick
max_allowed_packet = 32M

