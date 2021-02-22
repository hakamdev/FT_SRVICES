#!/bin/sh
apk		--no-cache update;
apk		--no-cache add openrc;
apk		--no-cache add libc6-compat;
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status;
apk		--no-cache add mariadb mariadb-common mariadb-client;

mysql_install_db --user=mysql --datadir=/var/lib/mysql

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
tar xf telegraf-1.17.3_linux_amd64.tar.gz

cp -r telegraf-1.17.3/etc/* /etc/;
cp -r telegraf-1.17.3/usr/* /usr/;
cp -r telegraf-1.17.3/var/* /var/;

rm -rf telegraf-1.17.3*

mv telegraf.conf /etc/telegraf/
