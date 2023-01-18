FROM neptunesoftware/planet9:v22.10.1

ENV HTTP_PROXY="http://localhost:3128"
ENV HTTPS_PROXY="http://localhost:3128"
USER root
RUN apt update -y && apt install procps net-tools squid -y
COPY squid.conf /etc/squid/squid.conf
COPY whitelist.txt /etc/squid/whitelist.txt
COPY init.sh /root/init.sh
RUN chmod +x /root/init.sh

ENTRYPOINT ["/root/init.sh"]