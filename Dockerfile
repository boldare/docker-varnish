FROM debian:stretch
MAINTAINER krzysztof.ciszewski@xsolve.pl

ENV DEBIAN_FRONTEND noninteractive

RUN \
  echo "deb http://ftp.de.debian.org/debian/ stretch main non-free contrib" > /etc/apt/sources.list && \
  echo "deb-src http://ftp.de.debian.org/debian/ stretch main non-free contrib" >> /etc/apt/sources.list && \
  echo "deb http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
  echo "deb-src http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
  apt-get -qq update && apt-get -qqy upgrade

RUN apt-get -yqq install --no-install-recommends \
  curl \
  python \
  gnupg2 \
  ca-certificates
  

RUN \
  curl -s https://packagecloud.io/install/repositories/varnishcache/varnish52/script.deb.sh | bash && \
  apt-get -qq update

RUN apt-get -yqq install \
  varnish --no-install-recommends

RUN apt-get -q autoclean && \
  rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh

CMD ["./start.sh"]
