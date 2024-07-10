#!/bin/bash

# wait until database is ready
while ! mysqladmin ping -h "$MYSQL_HOST" --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 1
done
# set up wp-cli
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

# if database already exists, skip set up
if [ ! -f wp-config.php ]; then
    echo 'WordPress not found. Installing...'
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname="$WP_DB_NAME" --dbuser="$WP_USER" --dbpass="$WP_PASSWORD" --dbhost="$MYSQL_HOST" --allow-root
    ./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root
    ./wp-cli.phar user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=author --user_pass="$WP_USER_PASSWORD" --allow-root
else
    echo 'WordPress already installed. Skipping installation...'
fi

php-fpm7.4 -F