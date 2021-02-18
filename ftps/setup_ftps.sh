#!/bin/sh

apk		--no-cache update;
apk		--no-cache add openrc;
apk		--no-cache add openssl;
apk		--no-cache add vsftpd;
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status;
rc-update add vsftpd
adduser -D hakam;
echo hakam:hakam | chpasswd;
rm -f /etc/vsftpd/vsftpd.conf
mv	vsftpd.conf /etc/vsftpd/
openssl req -nodes -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com"