#!/bin/sh
if [ "$(pgrep telegraf)" = "" -o "$(pgrep /usr/sbin/influxd)" = "" ]; then
        exit 1
else
        exit 0
fi