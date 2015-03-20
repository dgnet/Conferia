#!/bin/bash

for id in `docker ps -a -q`; do
    docker rm -f $id
done

docker build  -t application-base docker/application-base
docker build  -t application docker/application

docker run --name application -v $(pwd):/var/www/conferia -v ~/.composer:/root/.composer application

mkdir -p ~/conferia_mysql
docker build -t mysql docker/mysql
docker run --name mysql -v ~/conferia_mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=Coc0Nf3eriA! -e MYSQL_DATABASE=conferia -e MYSQL_USER=conferiauser -e MYSQL_PASSWORD=Coc0Nf3eriA! -d mysql
docker build  -t php5 docker/php-fpm
docker run -d --link mysql:mysql --name=php5 --volumes-from application php5
docker build  -t nginx docker/nginx
docker run -d --link php5:php5 --volumes-from application -p 6660:80 -e APP_NAME=conferia nginx

docker run --link mysql:mysql --name app --rm --volumes-from application -t -i application composer install --prefer-source --optimize-autoloader -n
docker run --link mysql:mysql --name app --rm --volumes-from application -t -i application "setfacl -R -m u:www-data:rwX -m u:root:rwX app/cache app/logs && setfacl -dR -m u:www-data:rwX -m u:root:rwX app/cache app/logs"
