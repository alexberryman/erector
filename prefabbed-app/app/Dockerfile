FROM php:7.4-fpm-alpine

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# This example is extremely barebones and specific to Alpine linux, however in most containers at/below
# php 7.3, you can just run pecl + docker-php-ext-enable (see below) after you've ensured that you have
# also installed phpize (necessary for building PHP extensions).
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
  # Important part:
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  # Install the PHP pdo_pgsql extention
  && apk --no-cache add postgresql-dev \
  && docker-php-ext-install pdo_pgsql \
  # Clean up...
  && apk del .phpize-deps

# Set the user and group id to the local user
RUN apk add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data
USER www-data

# Copy over our custom xdebug INI configuration which will coexist with the automatically generated
# $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini created by the "docker-php-ext-enable xdebug" command above.
COPY ./xdebug.ini $PHP_INI_DIR/conf.d

WORKDIR /var/www/html/app
