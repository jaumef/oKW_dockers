#!/bin/bash
echo "Using container name: 'frontend'"
name="frontend"
echo "Using default ports (8080->80 443->443)"
ports="8080:80 -p 443:443"
echo "Using as default html path: {cwd}/html"
html_path=$PWD"/html"
echo "Using as default nginx conf: {cwd}/nginx.conf"
nginx_config_path=$PWD"/nginx.conf"
container_id=`docker run -p $ports --name $name -d -v $html_path:/usr/share/nginx/html -v $nginx_config_path:/etc/nginx/sites-enabled/default.conf nginx`
if [ "$container_id" != "" ]
then
    echo "$container_id" > id_frontend
    echo "Container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm id_frontend
    fi
    echo "Error spawning docker!"
fi
