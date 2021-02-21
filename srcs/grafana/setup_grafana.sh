#!/bin/sh
apk --no-cache update;
apk --no-cache add libc6-compat;
tar -xvf grafana-7.4.2.linux-amd64.tar.gz;
mv grafana-7.4.2 /usr/share/grafana
mkdir -p /var/lib/grafana/dashboards
mv /dashboards/json/* /var/lib/grafana/dashboards
mv /dashboards/yaml/dashboards.yml /usr/share/grafana/conf/provisioning/dashboards/
rm -rf /dashboards


wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
tar xf telegraf-1.17.3_linux_amd64.tar.gz

cp -r telegraf-1.17.3/etc/* /etc/;
cp -r telegraf-1.17.3/usr/* /usr/;
cp -r telegraf-1.17.3/var/* /var/;

rm -rf telegraf-1.17.3*

mv telegraf.conf /etc/telegraf/