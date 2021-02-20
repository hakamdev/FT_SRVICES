#!/bin/sh
apk --no-cache update;
apk --no-cache add libc6-compat;
tar -xvf grafana-7.4.2.linux-amd64.tar.gz;