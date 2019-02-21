#!/bin/bash
set -e

go get github.com/gorilla/mux
go get github.com/justinas/alice

sed "s/%date%/${1}/;s/%id%/${2}/" data/index.in > data/index.html

go build -o server .
