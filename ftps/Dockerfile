FROM alpine:3.11

EXPOSE 21 20000 20001
COPY * /
RUN /setup_ftps.sh
CMD /start_ftps.sh