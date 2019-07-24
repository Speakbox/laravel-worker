FROM php:7.3-cli AS setup
MAINTAINER Valentin Prugnaud <valentin@speakbox.ca>

# Install php dependencies
RUN apt-get update \
    # gd
    && apt-get install -y --no-install-recommends curl git libzip-dev libfreetype6-dev libjpeg-dev libpng-dev libwebp-dev  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-webp-dir=/usr/include/ \
    && docker-php-ext-install gd \
    # bcmath
    && docker-php-ext-install bcmath \
    # ctype
    && docker-php-ext-install ctype \
    # json
    && docker-php-ext-install json \
    # mbstring
    && docker-php-ext-install mbstring \
    # pdo_mysql
    && docker-php-ext-install pdo_mysql \
    # opcache
    && docker-php-ext-enable opcache \
    # zip
    && docker-php-ext-install zip \
    # clean up
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear/ \
    && rm -rf /var/tmp/* \
    && rm -rf /tmp/*

# Install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require hirak/prestissimo
