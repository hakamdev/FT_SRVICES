#!/bin/sh
/etc/init.d/mariadb setup;

rm /etc/my.cnf.d/*
cp mariadb-server.conf /etc/my.cnf
chown -R mysql: /etc/my.cnf

service mariadb start;

FILE=/var/lib/mysql/wordpress/wp_users.ibd
if test -f "$FILE"; then
        echo "database already exists!"
else
        mysql -u root -e "CREATE DATABASE wordpress;";
		mysql -u root -e "CREATE DATABASE phpmyadmin;";
		mysql -u root wordpress < /wordpress.sql;
		mysql -u root phpmyadmin < /phpmyadmin.sql;
		mysql -u root -e "CREATE USER 'hakam'@'%' IDENTIFIED BY 'hakam';"
		mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'hakam'@'%';";
		mysql -u root -e "FLUSH PRIVILEGES;";
fi
telegraf &
top