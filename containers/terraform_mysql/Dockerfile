FROM cgr.dev/chainguard/mariadb:latest-dev as builder
USER root
RUN apk update && apk add openssh && apk add gosu && /usr/sbin/sshd
# Defina variáveis de ambiente
ENV MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1 \
    MARIADB_USER=wp-user \
    MARIADB_PASSWORD=wp-password \
    MARIADB_DATABASE=wordpress

