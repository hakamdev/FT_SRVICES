FROM alpine:3.11

EXPOSE 8086

COPY * /
RUN /setup_influxdb.sh
CMD /start_influxdb.sh