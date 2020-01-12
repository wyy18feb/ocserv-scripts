#! /bin/bash

# 路径变量
ROOT_PATH="/etc/ocserv/"
TMPL_PATH=${ROOT_PATH}"tmpl/"
SSL_PATH=${ROOT_PATH}"ssl/"

# 安装
source install.sh

# 配置证书和密钥
source build_ca.sh
source build_server.sh

# 配置网络
source config.sh

# 运行
source run.sh

echo "OCSERV is running..."
echo "to add users, please use command:"
echo "ocpasswd -c /etc/ocserv/ocpasswd <username>"
