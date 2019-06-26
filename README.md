# AutoDw
数仓自动化脚本运维      
2019-06-24  

#文件结构
+ [bin，shell脚本]
    + [dw，数仓]
    + [os，操作系统]
    + [web，应用层]
+ [log，日志]
+ [init，开机自启动服务]
+ [conf，配置文件]
+ [repo，安装包仓库]
+ [res，引用jar包]

#hostname
数仓集群根据hostname区分master，slaver节点，默认sjck-node00是主节点，01，02等是子节点，01是部署监控平台的节点

#强制规定
os，dw，web对应的是3个入口文件，然后分别调用bin目录对应的子文件夹里的脚本。  
每一个if判断里必须要写日志，有利于后期查看维护   
写日志demo，/bin/os/install_os.sh，/bin/os/mkdf.sh
 
#脚本使用
1


