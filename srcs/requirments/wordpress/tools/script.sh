#!/bin/bash

cd /var/www/html

if [ ! -f "./wp-config.php" ]; then
	mkdir -p /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar

	wp-cli.phar core download --allow-root
	wp-cli.phar config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$WP_DATABASE_HOST --allow-root
	wp-cli.phar core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp-cli.phar user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root
	wp-cli.phar theme install astra --activate --allow-root

	sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
	mkdir -p /run/php
fi

/usr/sbin/php-fpm8.2 -F