#!/bin/sh

# create mysql
if [ -d "/run/mysql" ]; then
	chown -R mysql:mysql /run/mysqld
    # if the directory already exists, skip this
else
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	# create mysql directory and give the right permissions
fi

# create mysql data directory
if [ -d /var/lib/mysql/mysql ]; then
	chown -R mysql:mysql /var/lib/mysql
else
	chown -R mysql /var/lib/mysql
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql --rpm > /dev/null

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
   	 return 1
	fi

	cat << EOF > $tfile
USE mysql ;
FLUSH PRIVILEGES ;

DROP DATABASE IF EXISTS test ;

GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
SET PASSWORD FOR 'root'@'%'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
FLUSH PRIVILEGES ;

CREATE DATABASE IF NOT EXISTS $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE USER '$WP_USER'@'localhost' IDENTIFIED BY '$WP_PASSWORD';
CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$WP_USER'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO '$WP_USER'@'%';
FLUSH PRIVILEGES ;

EOF

/usr/bin/mysqld --user=mysql --bootstrap < $tfile
# execute the query passing the content from the temp file

rm -f $tfile

fi

# allow remote connections
#sed -i "s|.*skip-networking.*|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
#sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

#exec /usr/bin/mysqld --user=mysql --console

#ESTAS TRES ULTIMAS LINEAS SON NECESARIAS?