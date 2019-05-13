#! /bin/bash

cd detail
nohup ./save_internal_agent.sh >log_save_internal_agent.txt 2>&1 &
cd ..
