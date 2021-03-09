#!/bin/sh

echo "1- Installing Necessary Packages...";
apk --no-cache update > /dev/null;
apk --no-cache add nginx > /dev/null;
apk --no-cache add openrc > /dev/null;
apk --no-cache add openssh > /dev/null;
apk --no-cache add openssl > /dev/null;
apk --no-cache add libc6-compat > /dev/null;

echo "2- Setting Up OpenRC...";
mkdir	/run/openrc > /dev/null;
touch	/run/openrc/softlevel > /dev/null;
rc-status > /dev/null;
rc-update add nginx > /dev/null;
rc-update add sshd > /dev/null;

echo "3- Creating a User for SSH...";
adduser -D hakam > /dev/null;
echo hakam:hakam | chpasswd > /dev/null; 

echo "4- Configuring Nginx...";
mkdir /var/www/html > /dev/null;
mv index.html /var/www/html/ > /dev/null;
chmod 755 /var/www/html > /dev/null;
chown -R nginx: /var/www/html > /dev/null;
rm -rf /etc/nginx/nginx.conf > /dev/null;
mv nginx.conf /etc/nginx/ > /dev/null;
chown -R nginx: /etc/nginx/nginx.conf > /dev/null;
chmod 755 /etc/nginx/nginx.conf > /dev/null;
mkdir /run/nginx/ > /dev/null;

echo "5- Generating Certificate and Key for Nginx Secure Connection SSL...";
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/nginx.pem -keyout /etc/ssl/private/nginx.key -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com/name=hakamdev" > /dev/null;
chown	-R nginx: /etc/ssl/private/nginx.key > /dev/null;
chown	-R nginx: /etc/ssl/certs/nginx.pem > /dev/null;

echo "6- Installing and Configuring Telegraf of Data Collection...";
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
tar xf telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
cp -r telegraf-1.17.3/etc/* /etc/ > /dev/null;
cp -r telegraf-1.17.3/usr/* /usr/ > /dev/null;
cp -r telegraf-1.17.3/var/* /var/ > /dev/null;
mv telegraf.conf /etc/telegraf/ > /dev/null;

echo "7- Cleaning Up...";
rm -rf telegraf-1.17.3* > /dev/null;
rm -rf setup_ngin_x.sh Dockerfile dep-nginx.yml > /dev/null;
