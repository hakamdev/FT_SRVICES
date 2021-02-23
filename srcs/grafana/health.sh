#!/bin/sh
if [ "$(pgrep telegraf)" = "" -o "$(pgrep grafana-server)" = "" ]; then
        exit 1
else
        exit 0
fi