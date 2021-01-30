apk		--no-cache update;
apk		--no-cache add openrc;
mkdir	/run/openrc;
touch	/run/openrc/softlevel
apk		--no-cache add mariadb mariadb-common mariadb-client

/etc/init.d/mariadb setup
rc-status
# echo "port = 3306" >> /etc/my.cnf;
# echo "bind-address = 0.0.0.0" >> /etc/my.cnf;
# echo "socket=/run/mysqld/mysqld.sock" >> /etc/my.cnf;
# echo "skip-networking=false" >> /etc/my.cnf;
