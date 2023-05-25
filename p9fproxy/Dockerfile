FROM neptunesoftware/planet9:v22.10.6

USER root
RUN apt update -y && apt install procps net-tools squid -y
COPY squid.conf /etc/squid/squid.conf
COPY whitelist.txt /etc/squid/whitelist.txt
COPY init.sh /init.sh
RUN chmod +x /init.sh

ENTRYPOINT [ "/init.sh" ]