#! /bin/bash

/bin/cp -rf "conf/ocserv.conf" ${ROOT_PATH}
/bin/cp -rf "conf/sysctl.conf" /etc/sysctl.conf
sysctl -p

# 开放443端口允许tcp连接
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# 开放443端口允许udp连接
iptables -A INPUT -p udp --dport 443 -j ACCEPT
# 使得NAT生效
iptables -t nat -A POSTROUTING -j MASQUERADE
