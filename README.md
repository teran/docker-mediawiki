![Layers size](https://images.microbadger.com/badges/image/teran/mediawiki.svg)
[![Docker Automated build](https://img.shields.io/docker/automated/teran/mediawiki.svg)](https://hub.docker.com/r/teran/mediawiki/)

## What is it?
Mediawiki in docker container using [nginx + php7-fpm](https://github.com/teran/docker-php7-fpm)

## Which version?
`latest` tag always points to the most recent release.
Tags points to specific versions, for instance `1.28.1`

## How to use?
Run command example:
```
docker run -it \
  -v /Users/teran/Downloads/data:/var/www/images \
  -v /Users/teran/Downloads/LocalSettings.php:/var/www/LocalSettings.php \
  --link=mysql \
  -p 8080:80 \
  teran/mediawiki:1.28.1
```

As you can see it uses volumes to provide LocalSettings data to mediawiki app.
If it would be empty you'll see installation procedure. Please note, by default
pictures are stored in `/var/www/images` which should be a persistent volume to
avoid data loss. Additionaly this image will require external mysql instance
(that's why `--link mysql` is present in example).
