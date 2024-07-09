#!/bin/bash

while ! mariadb -h$MYSQL_HOST -u$WP_DB_USER -p$WP_PASSWORD $WP_NAME --silent; do
	echo "[INFO] waiting for database..."
	sleep 1;
done

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname="$WP_DB_NAME" --dbuser="$WP_USER" --dbpass="$WP_PASSWORD" --dbhost=mariadb --allow-root
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root
./wp-cli.phar user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=author --user_pass="$WP_USER_PASSWORD" --allow-root

php-fpm7.4 -F