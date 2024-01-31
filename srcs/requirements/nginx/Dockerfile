# OS / image
FROM debian:bullseye
# RUN commands during the build
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt install nginx -y \
&& apt install vim -y \
&& apt install openssl -y \
# x509 : auto signed certificat / -nodes : no private keys password / -out : where the certificat will be created / -keyout : where the private key will be created
# SSL/TLS : Confidentiality(Encryption), Integrity, Authentication
# Handshake : Connection initiation, Server Response, Certificate verification, Key exchange, Communication encryption
# Auto-signed cert : browser warnings, no authentication : No CA (Certificate Authority)
&& mkdir -p /etc/nginx/ssl \
&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=chabrune.42.fr/UID=chabrune" \
&& mkdir -p /var/run/nginx

RUN chmod -R 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html
RUN mkdir -p /logs
# COPY files
COPY conf/nginx.conf /etc/nginx/conf.d/inception.conf
# CMD command when the container is launched
CMD [ "nginx", "-g", "daemon off;" ]