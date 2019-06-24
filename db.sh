#!/bin/bash
## 该脚本将会启动数据库的安装过程，用于全新设备的安装
##set up the yum repository  and install
if [[ ! -d "./log" ]]; then
		mkdir log
fi
echo "====================================================="
echo "====================================================="
echo "please select operation you would do to db? 请选择要做的操作？"
echo " yes  continue 继续执行初始化"
echo " no  cancel and quit 取消并退出"
echo "====================================================="
read selection
if [[ ${selection} == 'yes' ]]; then

	echo "installing db...  please wait...正在安装，请稍后.............."
	echo "..............please wait............请稍后..............."
	echo "you can tail -f  /root/AutoDw/log/db.log file to get the recent message in another console."
	echo "你可以在新窗口上通过tail -f /root/AutoDw/log/db.log命令获取最近安装信息"
	echo "..............please wait............请稍后..............."
else
	echo "canceled.已经取消"
fi
