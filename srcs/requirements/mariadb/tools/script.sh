#!/bin/bash

# create mysql directories
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

# start mariadb in the background
mysqld_safe &

# wait for mysql to start
while ! mysqladmin ping --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 1
done

# check if database already exists
DB_EXISTS=$(mysql -u root -p${WP_PASSWORD} -e "SHOW DATABASES LIKE '${WP_DB_NAME}';" | grep "${WP_DB_NAME}" > /dev/null; echo "$?")

if [ $DB_EXISTS -eq 1 ]; then
    echo "Database ${WP_DB_NAME} does not exist. Creating..."
    # initialize database and user
    mysql -u root -p${WP_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`;"
    mysql -u root -p${WP_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${WP_USER}\`@'localhost' IDENTIFIED BY '${WP_PASSWORD}';"
    mysql -u root -p${WP_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO \`${WP_USER}\`@'%' IDENTIFIED BY '${WP_PASSWORD}';"
    mysql -u root -p${WP_PASSWORD} -e "FLUSH PRIVILEGES;"
else
    echo "Database ${WP_DB_NAME} already exists. Skipping initialization."
fi

mysqladmin -u root -p${WP_PASSWORD} shutdown

# start mariadb in the foreground
exec mysqld_safe