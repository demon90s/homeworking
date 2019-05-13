#! /bin/bash

source ./config.sh

OLD_DIR=$(pwd)

f_check_ssh()
{
	process=$(ps aux | grep -v grep | grep "ssh -fCNR ${agent_port}")

	if [ -n "$process" ]; then
		return 0
	else
		return 1
	fi
}

f_main()
{
	while true; do
		echo -e $(date) "Begin check internal agent: \c"

		if [ f_check_ssh ]; then
			echo "agent alive"
		else
			echo "agent NOT alive, start it now"

			cd ..
			./internal_agent_start.sh
			cd ${OLD_DIR}
		fi

		sleep 300
	done
}

f_main $@
