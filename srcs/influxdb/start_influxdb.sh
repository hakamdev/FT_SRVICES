#!/bin/sh
echo "Starting Up Services...";
/etc/init.d/influxdb start
telegraf &
top