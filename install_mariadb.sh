#!/bin/bash

rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB

cat <<EOF > /etc/yum.repos.d/mariadb.repo
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos6-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
enabled=1
EOF

cat <<EOF > /etc/my.cnf.d/server.cnf
[server]

[mysqld]
server_id=12

[galera]

[embedded]

[mariadb]

[mariadb-10.1]
EOF

yum -y erase mysql-community-common
yum -y install MariaDB-devel MariaDB-client MariaDB-server
service mysql start
