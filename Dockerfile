FROM ubuntu:bionic

RUN mkdir /app /app/data
WORKDIR /app

COPY server ./
COPY data/ ./data/

EXPOSE 8080

CMD ./server
