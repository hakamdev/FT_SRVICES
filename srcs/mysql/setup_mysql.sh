#!/bin/sh
apk		--no-cache update;
apk		--no-cache add openrc;
apk --no-cache add libc6-compat;
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
apk		--no-cache add mariadb mariadb-common mariadb-client;
mysql_install_db --user=mysql --datadir=/var/lib/mysql
/etc/init.d/mariadb setup;
rc-status;
service mariadb start;
mysql -u root -e "CREATE DATABASE wordpress;";
mysql -u root -e "CREATE DATABASE phpmyadmin;";
mysql -u root wordpress < /wordpress.sql;
mysql -u root phpmyadmin < /phpmyadmin.sql;
mysql -u root -e "CREATE USER 'hakam'@'%' IDENTIFIED BY 'hakam';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'hakam'@'%';";
mysql -u root -e "FLUSH PRIVILEGES;";
service mariadb stop;

rm /etc/my.cnf.d/*
cp mariadb-server.conf /etc/my.cnf
chown -R mysql: /etc/my.cnf

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
tar xf telegraf-1.17.3_linux_amd64.tar.gz

cp -r telegraf-1.17.3/etc/* /etc/;
cp -r telegraf-1.17.3/usr/* /usr/;
cp -r telegraf-1.17.3/var/* /var/;

rm -rf telegraf-1.17.3*

mv telegraf.conf /etc/telegraf/
