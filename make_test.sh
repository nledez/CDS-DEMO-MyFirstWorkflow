#!/bin/bash
go get github.com/gorilla/mux
go get github.com/justinas/alice
go get github.com/stretchr/testify/assert

go test -cover -coverprofile=coverage.out -v 2>&1 | tee test.log
go tool cover -html=coverage.out -o coverage.html

go get -u github.com/jstemmer/go-junit-report
cat test.log | go-junit-report > report.xml
