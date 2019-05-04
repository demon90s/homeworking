#! /bin/bash

source ./detail/config.sh

f_main()
{
	ssh -l ${agent_user} -p ${public_port} -i ${rsa_file} ${public_ip}
}

f_main $@
