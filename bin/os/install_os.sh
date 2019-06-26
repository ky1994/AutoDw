#!/bin/bash

if [ hostname = "sjck-node00" ];then
        echo "master dw_mkdir 0 1 1 1"
        ./bin/os/dw_mkdir.sh 0 1 1 1 >> ./log/os.log 2>&1;
else
        echo "slaver dw_mkdir 2 3"
        ./bin/os/dw_mkdir.sh 2 3 >> ./log/os.log 2>&1;
fi

./bin/os/mkfs.sh >> ./log/os.log

exit    0