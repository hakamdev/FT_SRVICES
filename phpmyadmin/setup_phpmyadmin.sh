apk		--no-cache update;
apk		--no-cache add nginx;
apk		--no-cache add openrc;
apk		--no-cache add php7 php7-fpm php7-curl php7-json php7-mbstring php7-session;
apk		--no-cache add php7-zip php7-gd php7-soap php7-ssh2 php7-xml;
apk		--no-cache add php7-tokenizer php7-mysqli lighttpd php7-cgi fcgi;

rc-update add nginx;
mkdir	/var/www/html;
# mv index.html /var/www/html;

tar     -xvf phpMyAdmin-5.0.2-english.tar.gz
mv      phpMyAdmin-5.0.2-english/* /var/www/html/
rm      -f phpMyAdmin-5.0.2-english.tar.gz
mkdir	/var/www/html/tmp
chmod	777	/var/www/html/tmp
rm		-rf /var/www/html/config.sample.inc.php
cp		config.inc.php /var/www/html/

chmod	755 /var/www/html;
chown	-R nginx: /var/www/html;
rm		-rf /etc/nginx/conf.d/default.conf;
mv		default.conf /etc/nginx/conf.d/;
chown	-R nginx: /etc/nginx/conf.d/default.conf;
chmod	755 /etc/nginx/conf.d/default.conf;
mkdir	/run/nginx/;

# mkdir	/etc/ssl/private/
# mv      localhost.crt /etc/ssl/certs/
# mv      localhost.key /etc/ssl/private/
# chown	-R nginx: /etc/ssl/private/localhost.key
# chown	-R nginx: /etc/ssl/certs/localhost.crt
