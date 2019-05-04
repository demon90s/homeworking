#! /bin/bash

f_main()
{
    while true ; do
        ./connect_internal.sh echo "hi agent"
        if [ "$?" = "0" ] ; then
            echo $(date)" save connect succ"
        else
            echo $(date) "save connect failed"
            exit 1
        fi
        sleep 30
    done
}

f_main $@
