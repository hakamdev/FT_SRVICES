FROM alpine:3.11

EXPOSE 21 40000 40001
COPY * /
RUN /setup_ftps.sh
CMD /start_ftps.sh