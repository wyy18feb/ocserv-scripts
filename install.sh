#! /bin/bash

# 安装ocserv,gnutls-bin
apt-get update
apt-get install ocserv gnutls-bin

# 先把系统的socket进程停掉
systemctl stop ocserv.socket

# 将配置文件拷贝到/etc/ocserv/下
mkdir -p ${TMPL_PATH}
mkdir -p ${SSL_PATH}
