#! /bin/bash

# 启动公网正向代理

source ./detail/config.sh

SSH="ssh -l ${agent_user} -p ${public_port} -i ${rsa_file} ${public_ip}"

f_main()
{
	ssh -fCNL *:${public_port}:localhost:${agent_port} localhost -p ${ssh_port} -i ${rsa_file}

	nohup ./detail/save_connect.sh >log_save_office_connect.txt 2>&1 &
}

f_main $@
