#!/bin/bash
container="backend"
image="okw/"$container
#docker rmi $image
docker build -t $image --network host .
ports="-p 5000:5000"
# Ensure sockets directory exist
sockets_path="/tmp/docker_sockets"
sockets="-v $sockets_path:/tmp/"
if [ -d $sockets_path ]; then
    mkdir -p $sockets_path
fi
./stop_backend.sh
container_id=`docker run -d $ports --name $container $sockets --network host -i $image`
if [ "$container_id" != "" ]
then
    echo "$container_id" > id_backend
    echo "Container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm id_backend
    fi
    echo "Error spawning docker!"
fi
# Enable writing on socket
chmod 777 $sockets_path/orakwlum-api.sock
