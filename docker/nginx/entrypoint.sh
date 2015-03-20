#!/bin/bash

for env in $(printenv); do
    IFS== read KEY VALUE <<< "$env"
    sed "s,\${${KEY}},${VALUE},g" -i /etc/nginx/sites-enabled/default
done;

exec /usr/sbin/nginx
