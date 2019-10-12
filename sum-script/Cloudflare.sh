#!/bin/bash
# Name  : Anti IP Leakage
# Author: Zhys
# Date  : 2019

# 禁止来自IPv4的所有HTTP/S访问请求
iptables -I INPUT -p tcp --dport 80 -j DROP
iptables -I INPUT -p tcp --dport 443 -j DROP

# 对Cloudflare CDN IPv4地址开放HTTP/S入站访问
for i in `curl https://www.cloudflare.com/ips-v4`; do iptables -I INPUT -s $i -p tcp --dport 80 -j ACCEPT; done
for i in `curl https://www.cloudflare.com/ips-v4`; do iptables -I INPUT -s $i -p tcp --dport 443 -j ACCEPT; done

# 禁止来自IPv6的所有HTTP/S访问请求
ip6tables -I INPUT -p tcp --dport 80 -j DROP
ip6tables -I INPUT -p tcp --dport 443 -j DROP

# 对Cloudflare CDN IPv6地址开放HTTP/S入站访问
for i in `curl https://www.cloudflare.com/ips-v6`; do ip6tables -I INPUT -s $i -p tcp --dport 80 -j ACCEPT; done
for i in `curl https://www.cloudflare.com/ips-v6`; do ip6tables -I INPUT -s $i -p tcp --dport 443 -j ACCEPT; done

# 保存iptables配置
iptables-save
ip6tables-save

# 注意：80/443为默认HTTP/S协议通讯使用端口，若实际应用有使用非80/443端口进行，请依葫芦画瓢自行修改脚本
# Ubuntu系统可以使用UFW则类似：for i in `curl https://www.cloudflare.com/ips-v4`; do ufw allow proto tcp from $i to any port 80; done
# 基于Linux系统兼容性考虑脚本使用iptables配置系统防火墙，请自行根据各自系统、防火墙不同做相应配置调整实施