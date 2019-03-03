#!/bin/bash
set -e

go get github.com/gorilla/mux
go get github.com/justinas/alice

if [ ! -f data/date.txt ]; then
	echo "Fake date" > data/date.txt
fi

sed "s/%date%/$(cat data/date.txt)/;s/%id%/${1:-0}/" data/index.in > data/index.html
wget -O data/jquery.js https://code.jquery.com/jquery-3.3.1.min.js

go build -o server .

tar cvzf server.tgz server data/*.html data/*.txt
