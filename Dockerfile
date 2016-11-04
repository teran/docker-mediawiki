FROM teran/php5-fpm:latest

MAINTAINER Igor Shishkin <me@teran.ru>
LABEL application=mediawiki
LABEL version=1.27.1
LABEL description="Mediawiki==1.27.1 with nginx and php5-fpm"

RUN wget -O /tmp/mediawiki.tgz https://releases.wikimedia.org/mediawiki/1.27/mediawiki-1.27.1.tar.gz && \
    mkdir -p /var/www && \
    tar xzf /tmp/mediawiki.tgz -C /tmp && \
    cp -r /tmp/mediawiki*/* /var/www/ && \
    rm -rf /tmp/mediawiki*

EXPOSE 80
