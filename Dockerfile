FROM caddy:2.3.0-alpine AS caddy

RUN apk add php-fpm

COPY docker-cmd.sh /
COPY Caddyfile /etc/caddy/Caddyfile
COPY index.php /srv/

CMD [ "/docker-cmd.sh" ]



FROM php:7.4.16-cli-alpine3.13 AS php

COPY index.php /index.php

CMD [ "php", "-S", "0.0.0.0:8080", "/index.php" ]

EXPOSE 8080
