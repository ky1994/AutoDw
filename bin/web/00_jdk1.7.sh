#!/bin/bash

echo $(date +%Y-%m-%d\ %H:%M:%S)'，00_jdk1.7 begin'

#java -version
JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
echo ${JAVA_VERSION}

if [[ ${JAVA_VERSION} == *'1.8'* ]]
then
    echo "1.8"
else
    echo "else"
fi


echo $(date +%Y-%m-%d\ %H:%M:%S)'，00_jdk1.7 end'

exit    0