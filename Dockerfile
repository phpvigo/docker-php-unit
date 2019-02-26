ARG PHP_FROM_VERSION=7.3
FROM php:${PHP_FROM_VERSION}-cli

WORKDIR "/application"

RUN apt-get update \
    && apt-get install -y libicu-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && docker-php-ext-install intl

RUN apt-get update \
    && apt-get install -y libicu-dev libpng-dev libjpeg-dev libpq-dev  \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install intl gd mbstring

RUN apt-get update \
    && apt-get -y install unzip zlib1g-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN curl -sS https://phar.phpunit.de/phpunit-6.5.phar -o /usr/local/bin/phpunit

# Fix permission problems
RUN usermod -u 1000 www-data 

RUN echo 'alias ll="ls -l"' >> ~/.bashrc
RUN echo 'alias sf="php bin/console"' >> ~/.bashrc

COPY ./sh/docker-entrypoint.sh /usr/local/bin/
COPY ./sh/test-symfony2.sh /usr/local/bin/
COPY ./sh/test-symfony3.sh /usr/local/bin/
COPY ./sh/test-symfony4.sh /usr/local/bin/
COPY ./sh/test-laravel.sh /usr/local/bin/
COPY ./sh/test-vendor.sh /usr/local/bin/

RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat

ENV TEST_RUNNER_FRAMEWORK S4
ENV TEST_RUNNER_COVERAGE false
ENV TEST_RUNNER_COVERAGE_HTML false

WORKDIR /application

ENTRYPOINT ["docker-entrypoint.sh"]