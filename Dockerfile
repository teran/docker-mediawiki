FROM teran/php5-fpm:latest

MAINTAINER Igor Shishkin <me@teran.ru>
LABEL application=mediawiki
LABEL version=1.28.1
LABEL description="Mediawiki==1.28.1 with nginx and php5-fpm"

RUN wget -O- https://www.mediawiki.org/keys/keys.txt | gpg --import

RUN wget -O /tmp/mediawiki.tgz https://releases.wikimedia.org/mediawiki/1.28/mediawiki-1.28.1.tar.gz && \
    wget -O /tmp/mediawiki.sig https://releases.wikimedia.org/mediawiki/1.28/mediawiki-1.28.1.tar.gz.sig && \
    gpg --verify /tmp/mediawiki.sig /tmp/mediawiki.tgz && \
    mkdir -p /var/www && \
    tar xzf /tmp/mediawiki.tgz -C /tmp && \
    cp -r /tmp/mediawiki*/* /var/www/ && \
    rm -rf /tmp/mediawiki*
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
