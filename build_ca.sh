#! /bin/bash

cp tmpl/ca.tmpl ${TMPL_PATH}"ca.tmpl"

# 生成ca的私钥
certtool \
	--generate-privkey \
	--outfile ${SSL_PATH}"ca-key.pem"

# 通过ca的私钥和模板生成证书
certtool \
	--generate-self-signed \
	--load-privkey ${SSL_PATH}"ca-key.pem" \
	--template ${TMPL_PATH}"ca.tmpl" \
	--outfile ${SSL_PATH}"ca-cert.pem"
