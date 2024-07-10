#!/bin/bash

# Debugging: print environment variables
echo "WP_DB_NAME=${WP_DB_NAME}"
echo "WP_USER=${WP_USER}"
echo "WP_PASSWORD=${WP_PASSWORD}"

# Ensure the mysqld directory exists with proper permissions
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

# Start MariaDB in the background and log to file
mysqld_safe --log-error=/var/log/mysql/error.log &

# Wait for the MySQL service to start
while ! mysqladmin ping --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 1
done

# Check if the database is already initialized
if [ ! -d "/var/lib/mysql/${WP_DB_NAME}" ]; then
    # Set the root password and create the database and user if not initialized
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${WP_PASSWORD}';"
    mysql -u root -p${WP_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`;"
    mysql -u root -p${WP_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${WP_USER}\`@'localhost' IDENTIFIED BY '${WP_PASSWORD}';"
    mysql -u root -p${WP_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO \`${WP_USER}\`@'%' IDENTIFIED BY '${WP_PASSWORD}';"
    mysql -u root -p${WP_PASSWORD} -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p${WP_PASSWORD} shutdown
else
    echo "Database ${WP_DB_NAME} already initialized."
    mysqladmin -u root -p${WP_PASSWORD} shutdown
fi

# Start MariaDB in the foreground
exec mysqld_safe








#mysql_install_db
#mysqld


# SI LO OTRO FUNCIONA, BORRAR ESTO