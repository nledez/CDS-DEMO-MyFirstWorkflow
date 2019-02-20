FROM ubuntu:bionic

COPY server /usr/local/bin/server

EXPOSE 8080

CMD /usr/local/bin/server
