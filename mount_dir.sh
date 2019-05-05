#! /bin/bash

# 挂载远程目录
# usage: ./mount_dir remote_dir local_dir

source ./detail/config.sh

f_main()
{
	sshfs -p ${public_port} IdentityFile=${rsa_file} ${agent_user}@${public_ip}:$1 $2
}

f_main $@
