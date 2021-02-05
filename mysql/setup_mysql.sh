apk		--no-cache update;
apk		--no-cache add openrc;
mkdir	/run/openrc;
touch	/run/openrc/softlevel
apk		--no-cache add mariadb mariadb-common mariadb-client

/etc/init.d/mariadb setup
rc-status
