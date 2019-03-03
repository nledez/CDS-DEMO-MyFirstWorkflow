FROM ubuntu:bionic

RUN mkdir /app /app/data
WORKDIR /app

COPY server ./
COPY data/*.html data/*.js data/*.css data/*.txt ./data/

EXPOSE 8080

CMD ./server
