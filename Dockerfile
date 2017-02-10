FROM php:5.6-apache

MAINTAINER Pablo Aguilar Angulo <pabagan@gmail.com>

# Install Prestashop requirements
RUN apt-get update \
    && apt-get install -y libmcrypt-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libfreetype6-dev \
        libxml2-dev \
        libicu-dev \
        wget \
        unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install iconv intl mcrypt opcache pdo mysql mysqli pdo_mysql mbstring soap gd zip

# Apache configuration
RUN a2enmod rewrite

# PHP configuration
COPY config/php.ini /usr/local/etc/php/

CMD ["apache2-foreground"]
