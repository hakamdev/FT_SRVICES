#!/bin/sh
/etc/init.d/sshd start
nginx -g "daemon off;" &
telegraf &
top
