FROM alpine:3.20

# Update the package repository and install PHP, PHP extensions, and WordPress
RUN apk update && apk add --no-cache \
    php82 \
	php82-fpm \
	php82-mysqli \
	php82-json

	# Download and extract the latest version of WordPress
RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mv wordpress /var/www/html \
	&& chown -R nobody:nobody /var/www/html \
	&& chmod -R 755 /var/www/html

RUN	adduser -S nginx &&	addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf