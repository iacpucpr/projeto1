FROM cgr.dev/chainguard/wordpress:latest-dev as builder
USER root
RUN apk update && apk add openssh && /usr/sbin/sshd
ENV WORDPRESS_DB_HOST=mariadb \
    WORDPRESS_DB_USER=wp-user \
    WORDPRESS_DB_PASSWORD=wp-password \
    WORDPRESS_DB_NAME=wordpress \
    PATH="$PATH:/bin"
# Copie o conteúdo do document-root se necessário
COPY document-root  /var/www/html
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "php-fpm"]
