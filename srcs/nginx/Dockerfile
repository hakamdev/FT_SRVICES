FROM alpine:3.11

EXPOSE 443 80 22

COPY * /
RUN /setup_ngin_x.sh
CMD /start_ngin_x.sh