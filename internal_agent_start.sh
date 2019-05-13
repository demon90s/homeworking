#! /bin/bash

# 启动内网反向代理

source ./detail/config.sh

f_main()
{
	ssh -fCNR ${agent_port}:localhost:${internal_ssh_port} ${public_user}@${public_ip} -p ${public_ssh_port} -i ${rsa_file}
}

f_main $@
