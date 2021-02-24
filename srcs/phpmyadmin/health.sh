#!/bin/sh
if [ "$(pgrep telegraf)" = "" -o "$(pgrep nginx)" = "" -o "$(pgrep php-fpm)" = "" ]; then
        exit 1
else
        exit 0
fi