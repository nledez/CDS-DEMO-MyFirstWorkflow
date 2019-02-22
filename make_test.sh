#!/bin/bash
go test -cover -coverprofile=coverage.out -v 2>&1 | tee test.log
go tool cover -html=coverage.out -o coverage.html

go get -u github.com/jstemmer/go-junit-report
cat test.log | go-junit-report > report.xml
