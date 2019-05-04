#! /bin/bash

cd detail
nohup ./save_connect.sh >log_save_office_connect.txt 2>&1 &
cd ..
