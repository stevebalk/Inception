FROM alpine:3.19

ARG PHP_VERSION=82

# Update the package repository and install PHP and PHP extensions
RUN apk update && apk add --no-cache \
	curl \
	openssl \
    mariadb-client \
	php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
	php${PHP_VERSION}-session \
	php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-pecl-imagick \
    php${PHP_VERSION}-pecl-igbinary \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip


# RUN docker-php-ext-install phar
RUN	adduser -S nginx &&	addgroup -S nginx
COPY tools/script.sh /script.sh

ENTRYPOINT [ "/bin/sh", "/script.sh" ]