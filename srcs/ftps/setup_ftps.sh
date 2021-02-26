#!/bin/sh
echo "1- Installing Necessary Packages...";
apk --no-cache update > /dev/null;
apk --no-cache add openrc > /dev/null;
apk --no-cache add openssl > /dev/null;
apk --no-cache add vsftpd > /dev/null;
apk --no-cache add libc6-compat > /dev/null;

echo "2- Setting Up OpenRC...";
mkdir /run/openrc > /dev/null;
touch /run/openrc/softlevel > /dev/null;
rc-status > /dev/null;
rc-update add vsftpd > /dev/null;

echo "3- Adding a User for FTPS...";
adduser -D hakam > /dev/null;
echo hakam:hakam | chpasswd > /dev/null;

echo "4- Configuring VSFTPD...";
rm -f /etc/vsftpd/vsftpd.conf > /dev/null;
mv vsftpd.conf /etc/vsftpd/ > /dev/null;

echo "5- Generating SSL Certificate and Key for Secure Connection...";
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/private/vsftpd.key -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com/name=hakamdev" > /dev/null;

echo "6- Installing and Configuring Telegraf of Data Collection...";
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
tar xf telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
cp -r telegraf-1.17.3/etc/* /etc/ > /dev/null;
cp -r telegraf-1.17.3/usr/* /usr/ > /dev/null;
cp -r telegraf-1.17.3/var/* /var/ > /dev/null;
mv telegraf.conf /etc/telegraf/ > /dev/null;

echo "7- Cleaning Up...";
rm -rf telegraf-1.17.3* > /dev/null;
rm -rf setup_ftps.sh dep-ftps.yml Dockerfile > /dev/null;
