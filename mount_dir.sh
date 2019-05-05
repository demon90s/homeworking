#! /bin/bash

source ./detail/config.sh

f_main()
{
	sshfs -p ${public_port} ${agent_user}@${public_ip}:$1 $2
}

f_main $@
