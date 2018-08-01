FROM alpine:latest
LABEL authors="Pål Ruud <ruudud@gmail.com>, Lars Wilhelmsen <lars@sral.org>"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories \
    apk update \
    apk --no-cache add bash curl dnsmasq docker

RUN mkdir -p /etc/dnsmasq.d

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY run.sh /run.sh

ENV DNS_DOMAIN="test"
ENV EXTRA_HOSTS=""
ENV HOSTMACHINE_IP="172.17.0.1"
ENV NAMING="default"

EXPOSE 53/tcp
#EXPOSE 53/udp

ENTRYPOINT ["/run.sh"]
