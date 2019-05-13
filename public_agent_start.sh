#! /bin/bash

# 启动公网正向代理

source ./detail/config.sh

f_main()
{
	ssh -fCNL *:${public_port}:localhost:${agent_port} localhost -p ${internal_ssh_port} -i ${rsa_file}
}

f_main $@
