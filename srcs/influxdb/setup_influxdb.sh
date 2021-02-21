#!/bin/sh
apk		--no-cache update;
apk		--no-cache add openrc;
apk --no-cache add libc6-compat;

mkdir	/run/openrc;
touch	/run/openrc/softlevel;
rc-status;

adduser -D influxdb;
mkdir -p /etc/influxdb /var/lib/influxdb;
mv influxdb.conf /etc/influxdb/
chown influxdb:influxdb /etc/influxdb/*;
chown influxdb:influxdb /var/lib/influxdb;
apk		--no-cache add influxdb

wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
tar xf telegraf-1.17.3_linux_amd64.tar.gz

cp -r telegraf-1.17.3/etc/* /etc/;
cp -r telegraf-1.17.3/usr/* /usr/;
cp -r telegraf-1.17.3/var/* /var/;

rm -rf telegraf-1.17.3*

mv telegraf.conf /etc/telegraf/

rc-update add influxdb;