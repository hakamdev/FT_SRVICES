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
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/private/vsftpd.key -subj "/C=MA/ST=Bg/L=Benguerir/O=1337/OU=ComputerScience/CN=www.hakamdev.com/name=hakamdev"