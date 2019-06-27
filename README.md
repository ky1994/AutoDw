# AutoDw
数仓自动化脚本运维      
2019-06-24  

# 文件结构
+ [bin，shell脚本]
    + [dw，数仓]
    + [os，操作系统]
    + [web，应用层]
+ [log，日志]
+ [init，开机自启动服务]
+ [conf，配置文件]
+ [repo，安装包仓库]
    + [jdk-8u131-linux-x64.tar.gz，jdk]
    + [python3.6，python环境]
        + [gcc_rpm.tar.gz，gcc]
        + [Python-3.6.4.tgz，python3.6]
        + [zlib-1.2.11.tar.gz，zlib依赖]
+ [res，应用jar包]
    + [etl.jar，etl的jar包]
    + [DIM.jar，监控平台jar包]

# hostname
数仓集群根据hostname区分master，slaver节点，默认sjck-node00是主节点，01，02等是子节点，01是部署监控平台的节点

# 强制规定
os，dw，web对应的是3个入口文件，然后分别调用bin目录对应的子文件夹里的脚本。  
每一个if判断里必须要写日志，有利于后期查看维护   
写日志demo，/bin/os/install_os.sh，/bin/os/mkdf.sh

# 可重入，可单独执行
每一个单独功能的脚本，尽量解耦，可以单独执行，不要依赖其他脚本。  
可重入，重新执行规则，比如安装jdk环境的脚本，先判断java -version，是否已经安装。如果已有jdk环境则跳过，没有则安装

# 
repo和res目录里的都是安装包和jar包，不要上传，需要的话copy
 
# 脚本使用
1


