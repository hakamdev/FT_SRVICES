#!/bin/sh

apk		--no-cache update;
apk		--no-cache add openrc;
apk		--no-cache add influxdb
mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status;

adduser -D influxdb;
mkdir -p /etc/influxdb /var/lib/influxdb;
mv influxdb.conf /etc/influxdb/
chown influxdb:influxdb /etc/influxdb/*;
chown influxdb:influxdb /var/lib/influxdb;

rc-update add influxdb;