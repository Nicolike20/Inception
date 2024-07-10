FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server

# copy configuration files
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /usr/local/bin/script.sh

# create necessary directories
RUN mkdir -p /run/mysqld /var/log/mysql && \
    chown -R mysql:mysql /run/mysqld /var/log/mysql /var/lib/mysql && \
    chmod 755 /run/mysqld

# give permissions to the script
RUN chmod +x /usr/local/bin/script.sh

CMD ["sh", "/usr/local/bin/script.sh"]