FROM ubuntu:bionic

RUN mkdir /app /app/data
WORKDIR /app

RUN apt-get update && apt-get install -y \
	curl \
	&& rm -rf /var/lib/apt/lists/*

COPY server ./
COPY data/*.html data/*.txt ./data/

EXPOSE 8080

CMD ./server

HEALTHCHECK CMD curl -f http://localhost:8080/status || exit 1
