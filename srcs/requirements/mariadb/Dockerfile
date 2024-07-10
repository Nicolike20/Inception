FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /usr/local/bin/script.sh

# Ensure the necessary directories exist with proper permissions
RUN mkdir -p /run/mysqld /var/log/mysql && \
    chown -R mysql:mysql /run/mysqld /var/log/mysql /var/lib/mysql && \
    chmod 755 /run/mysqld

RUN chmod +x /usr/local/bin/script.sh

CMD ["sh", "/usr/local/bin/script.sh"]

#EXPOSE 3306 ESTO ES NECESARIO?

#instalamos mariadb-server y ejecutamos mysqld
#mysqld utility runs the server process for mariadb (or smth like that)

#copiamos el archivo de configuracion 'nuestro' al container
#copiamos el script init.sl al container (para inicializar la base de datos y nuestro usuario)

#creamos la carpeta /run/mysqld

#damos permisos de ejecucion al script y lo ejecutamos