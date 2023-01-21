#!/bin/bash

docker stop p9proxy
docker rm p9proxy
docker build -t tlodevacr.azurecr.io/p9proxy:latest .
docker run -d --name p9proxy -p 8080:8080 tlodevacr.azurecr.io/p9proxy:latest
docker push tlodevacr.azurecr.io/p9proxy:latest
# docker exec -it -u root p9proxy env
# docker exec -it -u root p9proxy cat /var/log/squid/access.log