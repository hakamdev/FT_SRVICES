#!/bin/sh
vsftpd /etc/vsftpd/vsftpd.conf &
telegraf &
top