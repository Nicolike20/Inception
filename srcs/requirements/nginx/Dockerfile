FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx && apt install -y openssl

# create necessary directories and ssl certificate
RUN mkdir -p etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SP/ST=Madrid/L=Madrid/0=42/OU=IT/CN=nortolan.42.fr/"

# copy configuration file
RUN mkdir -p /var/run/nginx
COPY ./conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]