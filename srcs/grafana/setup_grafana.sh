#!/bin/sh
echo "1- Installing Necessary Packages...";
apk --no-cache update > /dev/null;
apk --no-cache add libc6-compat > /dev/null;
apk --no-cache add unzip > /dev/null;

echo "2- Installing and Configuring Grafana...";
tar -xvf grafana-7.4.2.linux-amd64.tar.gz > /dev/null;
mv grafana-7.4.2 /usr/share/grafana > /dev/null;
mkdir -p /usr/share/grafana/data/ > /dev/null;
cp /grafana.db /usr/share/grafana/data/ > /dev/null;

echo "3- Installing and Configuring Telegraf of Data Collection...";
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
tar xf telegraf-1.17.3_linux_amd64.tar.gz > /dev/null;
cp -r telegraf-1.17.3/etc/* /etc/ > /dev/null;
cp -r telegraf-1.17.3/usr/* /usr/ > /dev/null;
cp -r telegraf-1.17.3/var/* /var/ > /dev/null;
mv telegraf.conf /etc/telegraf/ > /dev/null;

echo "4- Cleaning Up...";
rm -rf telegraf-1.17.3* > /dev/null;
rm -rf grafana-7.4.2* > /dev/null;
rm -rf setup_grafana.sh Dockerfile dep-grafana.yml grafana.db > /dev/null;
