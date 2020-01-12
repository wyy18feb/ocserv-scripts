#! /bin/bash

cp tmpl/server.tmpl ${TMPL_PATH}"server.tmpl"

# 获取公网IP并写入server模板
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
CN="cn\ =\ \"${PUBLIC_IP}\""
sed -i '1i\'"${CN}" ${TMPL_PATH}"server.tmpl"

# 生成server的私钥
certtool \
	--generate-privkey \
	--outfile ${SSL_PATH}"server-key.pem"

# 通过server的私钥和模板，以及ca的私钥和证书，生成server的证书
certtool \
	--generate-certificate \
	--load-privkey ${SSL_PATH}"server-key.pem" \
	--load-ca-certificate ${SSL_PATH}"ca-cert.pem" \
	--load-ca-privkey ${SSL_PATH}"ca-key.pem" \
	--template ${TMPL_PATH}"server.tmpl" \
	--outfile ${SSL_PATH}"server-cert.pem"
