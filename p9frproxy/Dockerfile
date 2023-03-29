FROM neptunesoftware/planet9:v22.10.5

USER root
RUN apt update -y && apt install procps net-tools squid haproxy haproxyctl -y
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
COPY squid.conf /etc/squid/squid.conf
COPY whitelist.txt /etc/squid/whitelist.txt
COPY init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT [ "/init.sh" ]