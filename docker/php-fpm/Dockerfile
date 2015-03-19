FROM application-base

ADD start.sh /start.sh
ADD app_environment.sh /etc/profile.d/app_environment.sh

RUN php5enmod xdebug

EXPOSE 9000

WORKDIR /var/www/conferia

ENTRYPOINT ["/start.sh"]
