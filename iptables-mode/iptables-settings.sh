#/bin/bash
IP_LIST=ip.sh
IPT=/usr/sbin/iptables

for ip in `cat $IP_LIST`;do
    $IPT -A INPUT -s $ip -p tcp --dport 50000 -j ACCEPT     
done


