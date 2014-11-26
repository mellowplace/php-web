FROM debian:jessie

RUN apt-get update && apt-get install -y \
        nginx \
        php5 \
        php5-fpm

VOLUME ["/var/log/php-web/", "/var/log/php-fpm/"]

RUN mkdir -p /var/osl/www && \
        echo "<?php phpinfo(); ?>" > /var/osl/www/index.php


ADD nginx/php-web /etc/nginx/sites-available/

RUN rm /etc/nginx/sites-enabled/default && \
        ln -s /etc/nginx/sites-available/php-web /etc/nginx/sites-enabled/php-web && \
        echo "daemon off;" >> /etc/nginx/nginx.conf

CMD service php5-fpm start && nginx

EXPOSE 80
EXPOSE 443
