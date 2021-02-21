#!/bin/sh
apk		--no-cache update;
apk		--no-cache add openrc;
apk		--no-cache add openssl;
apk		--no-cache add vsftpd;
apk --no-cache add libc6-compat;
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status;
rc-update add vsftpd
adduser -D hakam;
echo hakam:hakam | chpasswd;
rm -f /etc/vsftpd/vsftpd.conf
mv	vsftpd.conf /etc/vsftpd/
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/private/vsftpd.key -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com/name=hakamdev"

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
tar xf telegraf-1.17.3_linux_amd64.tar.gz

cp -r telegraf-1.17.3/etc/* /etc/;
cp -r telegraf-1.17.3/usr/* /usr/;
cp -r telegraf-1.17.3/var/* /var/;

rm -rf telegraf-1.17.3*

mv telegraf.conf /etc/telegraf/ 