apk		--no-cache update;
apk		--no-cache add openrc;
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
apk		--no-cache add mariadb mariadb-common mariadb-client;
mysql_install_db --user=mysql --datadir=/var/lib/mysql
/etc/init.d/mariadb setup;
rc-status;
service mariadb start;
mysql -u root -e "CREATE DATABASE wordpress;";
mysql -u root -e "CREATE USER 'hakam'@'%' IDENTIFIED BY 'hakam';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'hakam'@'%';";
mysql -u root -e "FLUSH PRIVILEGES;";
service mariadb stop;

rm /etc/my.cnf.d/*
cp mariadb-server.conf /etc/my.cnf
chown -R mysql: /etc/my.cnf
