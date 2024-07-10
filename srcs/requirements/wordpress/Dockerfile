FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    curl \
    mariadb-server

# create necessary directories and copy configuration files
RUN mkdir /var/run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./tools/script.sh .

# give permissions to script
RUN chmod +x script.sh

CMD ["sh", "./script.sh"]