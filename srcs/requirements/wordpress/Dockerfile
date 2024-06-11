FROM alpine:3.19

# Update the package repository and install PHP and PHP extensions
RUN apk update && apk add --no-cache \
	curl \
    php82 \
	php82-fpm \
	php82-mysqli \
	php82-json \
	php82-phar \
	php82-mbstring \
	php82-curl \
	php82-dom \
	php82-exif \
	php82-fileinfo \
	php82-hash \
	php82-openssl \
	php82-pcre \
	php82-gd \
	php82-xml \
	php82-zip

# RUN docker-php-ext-install phar

COPY tools/script.sh /script.sh

ENTRYPOINT [ "/bin/sh", "/script.sh" ]