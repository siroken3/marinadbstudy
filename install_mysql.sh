#!/bin/bash

yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum -y install mysql-community-server
cat <<EOF > /etc/my.cnf
[mysqld]
log_bin
server_id=$1
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock

# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

# Recommended in standard MySQL setup
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
EOF

service mysqld start

/usr/bin/mysqladmin password password -u root


echo 'GRANT REPLICATION SLAVE ON *.* TO replication_user@`%` identified by "password"' | mysql -u root -ppassword
