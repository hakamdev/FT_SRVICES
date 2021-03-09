#!/bin/sh

echo "Starting All Services..."
/etc/init.d/sshd start
nginx -g "daemon off;" &
telegraf &
top
