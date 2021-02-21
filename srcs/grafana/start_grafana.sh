#!/bin/sh
/usr/share/grafana/bin/grafana-server --homepath=/usr/share/grafana/ &
telegraf &
top