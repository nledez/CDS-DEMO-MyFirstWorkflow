FROM ubuntu:bionic

RUN mkdir /app /app/data
WORKDIR /app

COPY server ./
COPY data/*.html data/*.txt ./data/

EXPOSE 8080

CMD ./server

HEALTHCHECK CMD curl -f http://127.0.0.1:8080/ || exit 1
