#!/bin/sh
if [ "$(pgrep telegraf)" = "" -o "$(pgrep vsftpd)" = "" ]; then
        exit 1
else
        exit 0
fi