#!/bin/bash
echo "Using container name: 'frontend'"
name="frontend"
container="okw/"$name
echo "Using default ports (8080->80 443->443)"
ports="-p 8080:80 -p 443:443"
echo "Using as default html path: {cwd}/html"
html_path=$PWD"/html"
echo "Using as default nginx conf: {cwd}/nginx.conf"
nginx_config_path=$PWD"/nginx.conf"
docker build -t $container . 
container_id=`docker run $ports --name $name -d -i $container -v /tmp/docker_sockets:/tmp/`
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
