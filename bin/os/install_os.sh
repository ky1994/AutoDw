#!/bin/bash

echo $(date +%Y-%m-%d\ %H:%M:%S)'，install_os begin'

if [ hostname = "sjck-node00" ];then
        echo "master 00_dw_mkdir 0 1 1 1"
        ./bin/os/00_dw_mkdir.sh 0 1 1 1 >> ./log/os.log 2>&1;
else
        echo "slaver 00_dw_mkdir 2 3"
        ./bin/os/00_dw_mkdir.sh 2 3 >> ./log/os.log 2>&1;
fi

./bin/os/01_mkfs.sh >> ./log/os.log 2>&1;
./bin/os/02_mount.sh >> ./log/os.log 2>&1;
./bin/os/03_mkfs.sh >> ./log/os.log 2>&1;
./bin/os/04_nfs.sh >> ./log/os.log 2>&1;
./bin/os/05_ntp.sh >> ./log/os.log 2>&1;

echo $(date +%Y-%m-%d\ %H:%M:%S)'，install_os end'

exit    0