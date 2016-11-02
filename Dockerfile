FROM nginx

MAINTAINER Igor Shishkin <me@teran.ru>
LABEL application=mediawiki
LABEL version=1.27.1
LABEL description="Mediawiki==1.27.1 with nginx and php5-fpm"

RUN apt-get update && \
    apt-get dist-upgrade -y

RUN apt-get install -y \
    php5-apcu \
    php5-fpm \
    php5-gd \
    php5-memcache \
    php5-mysql \
    wget && \
    apt-get clean && \
    rm -rvf /var/lib/apt/lists/*

RUN wget -O /tmp/mediawiki.tgz https://releases.wikimedia.org/mediawiki/1.27/mediawiki-1.27.1.tar.gz && \
    mkdir -p /var/www && \
    tar xzf /tmp/mediawiki.tgz -C /tmp && \
    cp -r /tmp/mediawiki*/* /var/www/ && \
    rm -rf /tmp/mediawiki*

ADD nginx.conf /etc/nginx/nginx.conf
ADD php5-fpm.ini /etc/php5/fpm/pool.d/www.conf
ADD entrypoint.sh /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
