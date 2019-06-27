#!/bin/bash

echo $(date +%Y-%m-%d\ %H:%M:%S)'，00_dw_mkdir begin'

start_partition=$1
end_partition=$2
is_etl=$3
if [ -z $3  ];then
	is_etl=0
	echo "is_etl is 0"
fi

db2_user='sjck'
tbspaces_prefix='NODE00'
db2_usergroup='db2adm'
dir_name=''

outer_dir='jzfydw'
nfs_dir='db2home'
db_dir='database'
tbspace_dir='tablespaces'
backup_dir='backup'
download_dir='data'
etl_dir='ETLServer'
dump_dir='db2dump'

# change path to /
cd /
echo "change path to /"

# if not exist, create dir ${outer_dir}
if [ ! -d ${outer_dir} ];then
	mkdir ${outer_dir}
	echo "dir /${outer_dir} not exist, create dir /${outer_dir}"
fi

# change path to /${outer_dir}
cd ${outer_dir}
echo "change path to /${outer_dir}"

# if not exist, create dir /${outer_dir}/${nfs_dir}
if [ ! -d ${nfs_dir} ];then
        mkdir ${nfs_dir}
        echo "dir /${outer_dir}/${nfs_dir} not exist, create dir /${outer_dir}/${nfs_dir}"
fi


# if not exist, create dir /${outer_dir}/${db_dir}
if [ ! -d ${db_dir} ];then
        mkdir ${db_dir}
        echo "dir /${outer_dir}/${db_dir} not exist, create dir /${outer_dir}/${db_dir}"
fi

# change path to /${outer_dir}/${db_dir}
cd ${db_dir}
echo "change path to /${outer_dir}/${db_dir}"

# if not exist, create dir /${outer_dir}/${db_dir}/${db2_user}
if [ ! -d ${db2_user} ];then
        mkdir ${db2_user}
        echo "dir /${outer_dir}/${db_dir}/${db2_user} not exist, create dir /${outer_dir}/${db_dir}/${db2_user}"
fi

# change path to /${outer_dir}/${db_dir}/${db2_user}
cd ${db2_user}
echo "change path to /${outer_dir}/${db_dir}/${db2_user}"

# according to the input numbers, create database partition dir
while [ ${start_partition} -le ${end_partition} ];do
	if [ ${start_partition} -le 9 ];then
		dir_name=NODE000${start_partition}
	else
		dir_name=NODE00${start_partition}
	fi
	if [ ! -d ${dir_name} ];then
       	        mkdir ${dir_name}
       	        echo "dir /${outer_dir}/${db_dir}/${dir_name} not exist, create dir /${outer_dir}/${db_dir}/${dir_name}"
	fi
	start_partition=$((start_partition+1))
done

# chwon ${db_dir} to ${db2_user}
chown ${db2_user}:${db2_usergroup} -R ../../${db_dir}

# change path to /${outer_dir}
cd /${outer_dir}
echo "change path to /${outer_dir}"

# if not exist, create dir /${outer_dir}/${tbspace_dir}
if [ ! -d ${tbspace_dir} ];then
        mkdir ${tbspace_dir}
        echo "dir /${outer_dir}/${tbspace_dir} not exist, create dir /${outer_dir}/${tbspace_dir}"
fi


# change path to /${outer_dir}/${tbspace_dir}
cd ${tbspace_dir}
echo "change path to ${tbspace_dir}"

start_partition=$1

# according to the input numbers, create tablespaces dir
while [ ${start_partition} -le ${end_partition} ];do
	if [ ${start_partition} -le 9 ];then
                dir_name=${tbspaces_prefix}0${start_partition}
        else
                dir_name=${tbspaces_prefix}${start_partition}
        fi
        if [ ! -d ${dir_name} ];then
        mkdir ${dir_name}
        echo "dir /${outer_dir}/${tbspace_dir}/${dir_name} not exist, create dir /${outer_dir}/${tbspace_dir}/${dir_name}"
fi
	start_partition=$((start_partition+1))
done


# chwon ${tbspace_dir} to ${db2_user}
chown ${db2_user}:${db2_usergroup} -R ../${tbspace_dir}

# change path to /${outer_dir}
cd /${outer_dir}
echo "change path to /${outer_dir}"

# create  etl server dir
if [ ${is_etl} -eq 1 ];then
        # if not exist, create dir /${outer_dir}/${download_dir}
	if [ ! -d ${download_dir} ];then
        	mkdir ${download_dir}
        	echo "dir /${outer_dir}/${download_dir} not exist, create dir /${outer_dir}/${download_dir}"
	fi
	# if not exist, create dir /${outer_dir}/${etl_dir}
        if [ ! -d ${etl_dir} ];then
                mkdir ${etl_dir}
                echo "dir /${outer_dir}/${etl_dir} not exist, create dir /${outer_dir}/${etl_dir}"
        fi
fi

# if not exist, create dir /${outer_dir}/${backup_dir}
if [ ! -d ${backup_dir} ];then
        mkdir ${backup_dir}
        echo "dir /${outer_dir}/${backup_dir} not exist, create dir /${outer_dir}/${backup_dir}"
fi

# chwon ${backup_dir} to ${db2_user}
chown ${db2_user}:${db2_usergroup} -R ${backup_dir}

# if not exist, create dir /${outer_dir}/${dump_dir}
if [ ! -d ${dump_dir} ];then
        mkdir ${dump_dir}
        echo "dir /${outer_dir}/${dump_dir} not exist, create dir /${outer_dir}/${dump_dir}"
fi


echo $(date +%Y-%m-%d\ %H:%M:%S)'，00_dw_mkdir end'
exit    0