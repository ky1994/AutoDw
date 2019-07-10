#!/bin/bash

#安装包路径，/home/python，需手动创建目录
#上传3个安装包，gcc_rpm.tar.gz，zlib-1.2.11.tar.gz，Python-3.6.4.tgz
#执行方式，sh python3.6.sh >>./python_install.log 2>&1

echo $(date +%Y-%m-%d\ %H:%M:%S)'，05_python3.6 begin'

base_path="/home/python/"

#gcc
cd ${base_path}
tar -zxvf gcc_rpm.tar.gz
cd gcc_rpm
sh install_gcc.sh

#zlib
cd ${base_path}
tar -zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure
make && make install

#python
cd /usr/local/
mv ${base_path}'Python-3.6.4.tgz' /usr/local/
tar xvf Python-3.6.4.tgz
mv Python-3.6.4 python-3.6
cd python-3.6/
./configure --prefix=/usr/local/python-3.6/
make && make install

#python3.6和pip软连接
cd /usr/bin/
mv /usr/bin/python /usr/bin/python2.6.6
ln -s /usr/local/python-3.6/bin/python3 /usr/bin/python
ln -s /usr/local/python-3.6/bin/pip3 /usr/bin/pip


echo $(date +%Y-%m-%d\ %H:%M:%S)'，05_python3.6 end'

exit    0