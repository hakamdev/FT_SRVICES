#!/bin/sh

echo "1- Installing Necessary Packages..."
apk --no-cache update > /dev/null;
apk --no-cache add openrc > /dev/null;
apk --no-cache add libc6-compat > /dev/null;
apk --no-cache add mariadb mariadb-common mariadb-client > /dev/null;

echo "2- Setting Up OpenRC...";
mkdir /run/openrc > /dev/null;
touch /run/openrc/softlevel > /dev/null;
rc-status > /dev/null;

echo "3- Installing MySQL...";
mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null;

echo "4- Installing and Configuring Telegraf of Data Collection...";
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
tar xf telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
cp -r telegraf-1.17.3/etc/* /etc/ > /dev/null;
cp -r telegraf-1.17.3/usr/* /usr/ > /dev/null;
cp -r telegraf-1.17.3/var/* /var/ > /dev/null;
mv telegraf.conf /etc/telegraf/ > /dev/null;


echo "5- Cleaning Up..."
rm -rf telegraf-1.17.3* > /dev/null;
rm -rf setup_mysql.sh Dockerfile dep-mysql.yml > /dev/null;