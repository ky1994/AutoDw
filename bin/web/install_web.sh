#!/bin/bash

echo $(date +%Y-%m-%d\ %H:%M:%S)'，install_web begin'

#./bin/web/00_jdk1.7.sh >> ./log/web.log 2>&1;
#01节点部署psql，监控平台
if [ hostname = "sjck-node01" ];then
        echo "01"
        #./bin/web/01_install_psql9.5.sh >> ./log/web.log 2>&1;
        #./bin/web/02_import_psql.sh >> ./log/web.log 2>&1;
        #./bin/web/03_springboot.sh >> ./log/web.log 2>&1;
        #./bin/web/05_python3.6.sh >> ./log/web.log 2>&1;
fi
#00节点部署etl的jar包
if [ hostname = "sjck-node00" ];then
        echo "00"
        #./bin/web/04_etl.sh >> ./log/web.log 2>&1;
fi

echo $(date +%Y-%m-%d\ %H:%M:%S)'，install_web begin'

exit    0