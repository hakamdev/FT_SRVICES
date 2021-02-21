#!/bin/sh
apk --no-cache update;
apk --no-cache add nginx;
apk --no-cache add openrc;
apk --no-cache add openssh;
apk --no-cache add openssl;
apk --no-cache add libc6-compat;

mkdir	/run/openrc;
touch	/run/openrc/softlevel;

rc-status
rc-update add nginx;
rc-update add sshd;

adduser -D hakam;
echo hakam:hakam | chpasswd; 

mkdir /var/www/html;
mv index.html /var/www/html/
chmod 755 /var/www/html;
chown -R nginx: /var/www/html;
rm -rf /etc/nginx/nginx.conf;
mv nginx.conf /etc/nginx/;
chown -R nginx: /etc/nginx/nginx.conf;
chmod 755 /etc/nginx/nginx.conf;
mkdir /run/nginx/;

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/nginx.pem -keyout /etc/ssl/private/nginx.key -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com/name=hakamdev"
chown	-R nginx: /etc/ssl/private/nginx.key
chown	-R nginx: /etc/ssl/certs/nginx.pem

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
tar xf telegraf-1.17.3_linux_amd64.tar.gz

cp -r telegraf-1.17.3/etc/* /etc/;
cp -r telegraf-1.17.3/usr/* /usr/;
cp -r telegraf-1.17.3/var/* /var/;

rm -rf telegraf-1.17.3*

mv telegraf.conf /etc/telegraf/