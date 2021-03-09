#!/bin/sh

echo "1- Installing Necessary Packages..."
apk --no-cache update > /dev/null;
apk --no-cache add nginx > /dev/null;
apk --no-cache add openrc > /dev/null;
apk --no-cache add php7 php7-fpm php7-curl php7-json php7-mbstring > /dev/null;
apk --no-cache add php7-zip php7-gd php7-soap php7-ssh2 php7-xml > /dev/null;
apk --no-cache add php7-tokenizer php7-mysqli lighttpd php7-cgi fcgi > /dev/null;
apk --no-cache add libc6-compat > /dev/null;

echo "2- Setting Up OpenRC..."
mkdir /run/openrc > /dev/null > /dev/null;
touch /run/openrc/softlevel > /dev/null;
rc-status > /dev/null;
rc-update add nginx default > /dev/null;
mkdir /var/www/html > /dev/null;

echo "3- Installing and Configuring Wordpress..."
tar     -xvf wordpress-5.6.1.tar.gz > /dev/null;
mv      wordpress/* /var/www/html/ > /dev/null;
mv		wp-config.php /var/www/html/ > /dev/null;
rm		-rf wordpress-5.6.1.tar.gz > /dev/null;

echo "4- Configuring Nginx..."
chmod 755 /var/www/html > /dev/null;
chown -R nginx: /var/www/html > /dev/null;
rm -rf /etc/nginx/conf.d/default.conf > /dev/null;
mv default.conf /etc/nginx/conf.d/ > /dev/null;
chown -R nginx: /etc/nginx/conf.d/default.conf > /dev/null;
chmod 755 /etc/nginx/conf.d/default.conf > /dev/null;
mkdir /run/nginx/ > /dev/null;

echo "5- Installing and Configuring Telegraf of Data Collection...";
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
tar xf telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
cp -r telegraf-1.17.3/etc/* /etc/ > /dev/null;
cp -r telegraf-1.17.3/usr/* /usr/ > /dev/null;
cp -r telegraf-1.17.3/var/* /var/ > /dev/null;
mv telegraf.conf /etc/telegraf/ > /dev/null;

echo "6- Cleaning Up...";
rm -rf telegraf-1.17.3* > /dev/null;
rm -rf setup_wordpress.sh Dockerfile dep-wp.yml > /dev/null;
