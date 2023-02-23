#!/bin/bash

docker stop p9frproxy
docker rm p9frproxy
docker build -t tlodevacr.azurecr.io/p9frproxy:latest .
docker run -d --name p9frproxy -p 4000:4000 -e HTTP_PROXY="http://localhost:3128" -e HTTPS_PROXY="http://localhost:3128" -e NO_PROXY=".sfso.no, .dfo.no" tlodevacr.azurecr.io/p9frproxy:latest
docker push tlodevacr.azurecr.io/p9frproxy:latest