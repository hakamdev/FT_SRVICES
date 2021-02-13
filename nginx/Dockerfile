FROM alpine:3.11

EXPOSE 443 80

COPY * /
RUN /setup_nginx.sh
CMD /start_nginx.sh