#! /bin/bash

source ./config.sh
SSH="ssh -l ${agent_user} -p ${public_port} -i ${rsa_file} ${public_ip} "

f_main()
{
    while true ; do
		echo -e $(date)" Begin save connect: \c"
        $SSH echo "hi agent"
        if [ "$?" = "0" ] ; then
            echo $(date)" save connect succ"
        else
            echo $(date) "save connect failed"
        fi
        sleep 30
    done
}

f_main2()
{
	$SSH "sleep 75686400000" # 100years
}

echo "PID: $$"
f_main $@

#f_main2 $@
