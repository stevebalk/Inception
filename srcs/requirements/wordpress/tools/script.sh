mkdir -p /var/www/html
cd /var/www/html

if [ ! -f "./wp-config.php" ]; then	
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root
	wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$WP_DATABASE_HOST --allow-root
	wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root
	wp theme install astra --activate --allow-root
fi

sed -i 's/;pid = run\/php-fpm82.pid/pid = run\/php-fpm82.pid/g' /etc/php82/php-fpm.conf

sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php82/php-fpm.d/www.conf
sed -i 's/user = nobody/user = nginx/g' /etc/php82/php-fpm.d/www.conf
sed -i 's/group = nobody/group = nginx/g' /etc/php82/php-fpm.d/www.conf
mkdir -p /run/php
chmod -R 777 /var/www/html/wp-content/

exec /usr/sbin/php-fpm82 -F