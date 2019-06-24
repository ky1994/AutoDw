#!/bin/bash
## 该脚本将会启动AutoDw的安装过程，用于全新设备的安装
##set up the yum repository  and install
if [[ ! -d "./log" ]]; then
		mkdir log
fi
echo "====================================================="
echo "====================================================="
echo "please select operation you would do? 请选择要做的操作？"
echo " yes  continue 继续执行初始化"
echo " no  cancel and quit 取消并退出"
echo "====================================================="
read selection
if [[ ${selection} == 'yes' ]]; then

	echo "installing...  please wait...正在安装，请稍后.............."
	echo "..............please wait............请稍后..............."
	echo "you can tail -f  /root/AutoDw/log/install.log file to get the recent message in another console."
	echo "你可以在新窗口上通过tail -f /root/AutoDw/log/install.log命令获取最近安装信息"
	echo "..............please wait............请稍后..............."
	./bin/AuditPlusInstall.sh >> ./log/install.log 2>&1;
	if [[ $? -eq 0 ]];then
			echo "==============================================================================================================================================================="
            echo "install finished.";
    else
    		echo "==============================================================================================================================================================="
            echo "some warning occurs.";
    fi
	echo "==============================================================================================================================================================="
	echo "you can cat the /root/AutoDw/log/install.log file to get the all message.你可以通过cat /root/AutoDw/log/install.log命令获取全部信息"

	./bin/10_show_status.sh
else
	echo "canceled.已经取消"
fi
