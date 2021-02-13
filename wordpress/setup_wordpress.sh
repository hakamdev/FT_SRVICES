apk --no-cache update;
apk --no-cache add nginx;
apk --no-cache add openrc;
apk --no-cache add php7 php7-fpm php7-curl php7-json php7-mbstring;
apk --no-cache add php7-zip php7-gd php7-soap php7-ssh2 php7-xml;
apk --no-cache add php7-tokenizer php7-mysqli lighttpd php7-cgi fcgi;

rc-update add nginx default;
mkdir /var/www/html;

tar     -xvf wordpress-5.5.3.tar.gz;
mv      wordpress/* /var/www/html/;
mv		wp-config.php /var/www/html/;
rm		-rf wordpress-5.5.3.tar.gz;

chmod 755 /var/www/html;
chown -R nginx: /var/www/html;
rm -rf /etc/nginx/conf.d/default.conf;
mv default.conf /etc/nginx/conf.d/;
chown -R nginx: /etc/nginx/conf.d/default.conf;
chmod 755 /etc/nginx/conf.d/default.conf;
mkdir /run/nginx/;

# mkdir	/etc/ssl/private/
# mv      localhost.crt /etc/ssl/certs/
# mv      localhost.key /etc/ssl/private/
# chown	-R nginx: /etc/ssl/private/localhost.key
# chown	-R nginx: /etc/ssl/certs/localhost.crt
