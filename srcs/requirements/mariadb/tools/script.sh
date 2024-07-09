#!/bin/bash

service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${WP_USER}\`@'localhost' IDENTIFIED BY '${WP_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${WP_DATABASE}\`.* TO \`${WP_USER}\`@'%' IDENTIFIED BY '${WP_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${WP_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$WP_PASSWORD shutdown
exec mysqld_safe
















#mysql_install_db
#mysqld


# SI LO OTRO FUNCIONA, BORRAR ESTO