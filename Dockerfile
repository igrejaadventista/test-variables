FROM php:7-apache

RUN apt-get update && apt-get install nano

COPY extras/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY extras/start-apache /usr/local/bin
COPY --chown=www-data:www-data app /var/www/html

ENV DOCKER docker
ENV GITHUB=/$secrets.GIHUB_SECRET

CMD ["start-apache"]