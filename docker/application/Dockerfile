FROM application-base

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD entrypoint.sh /entrypoint.sh
ADD app_environment.sh /etc/profile.d/app_environment.sh

VOLUME /var/www/conferia
WORKDIR /var/www/conferia

ENTRYPOINT ["/entrypoint.sh"]
CMD ["echo", "hello"]
