#!/bin/bash

echo $(date +%Y-%m-%d\ %H:%M:%S)'，01_mkfs begin'

#创建文件系统
mkfs.ext4 /dev/vg_database/lv_database
mkfs.ext4 /dev/vg_backup/lv_backup
mkfs.ext4 /dev/vg_db2home/lv_db2home
mkfs.ext4 /dev/vg_db2dump/lv_db2dump
mkfs.ext4 /dev/vg_tablespaces/lv_tablespaces

#主节点多挂载2个目录
if [ hostname = "sjck-node00" ];then
        echo "master mkfs.ext4 lv_data,lv_ETLServer"
        mkfs.ext4 /dev/vg_data/lv_data
        mkfs.ext4 /dev/vg_ETLServer/lv_ETLServer
fi

echo $(date +%Y-%m-%d\ %H:%M:%S)'，01_mkfs end'

exit    0