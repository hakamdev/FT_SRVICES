#!/bin/sh

echo "Starting Up Services...";
/usr/share/grafana/bin/grafana-server --homepath=/usr/share/grafana/ &
telegraf &
top