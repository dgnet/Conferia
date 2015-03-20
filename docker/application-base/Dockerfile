FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    acl  \
    curl \
    php5-cli \
    php5-fpm \
    php5-json \
    php5-intl \
    php5-curl \
    php5-mcrypt \
    php5-mysql \
    php5-apcu \
    php5-gd \
    php5-xdebug \
    mysql-client

ADD php.ini /etc/php5/fpm/php.ini
ADD php.ini /etc/php5/cli/php.ini

RUN apt-get install -y git
