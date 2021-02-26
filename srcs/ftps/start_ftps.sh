#!/bin/sh
echo "Starting Up Services...";
vsftpd /etc/vsftpd/vsftpd.conf &
telegraf &
top