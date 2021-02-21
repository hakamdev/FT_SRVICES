#!/bin/sh
/etc/init.d/influxdb start
telegraf &
top