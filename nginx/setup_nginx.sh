apk --no-cache update;
apk --no-cache add nginx;
apk --no-cache add openrc;

rc-update add nginx default;
mkdir /var/www/html;
mv		index.html /var/www/html/
chmod 755 /var/www/html;
chown -R nginx: /var/www/html;
rm -rf /etc/nginx/conf.d/default.conf;
mv default.conf /etc/nginx/conf.d/;
chown -R nginx: /etc/nginx/conf.d/default.conf;
chmod 755 /etc/nginx/conf.d/default.conf;
mkdir /run/nginx/;

mkdir	/etc/ssl/private/
mv      localhost.crt /etc/ssl/certs/
mv      localhost.key /etc/ssl/private/
chown	-R nginx: /etc/ssl/private/localhost.key
chown	-R nginx: /etc/ssl/certs/localhost.crt