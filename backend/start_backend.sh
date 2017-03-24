#!/bin/bash
container="backend"
image="okw/"$container
docker rmi $image
docker build -t $image --network host .
ports="5000:5000"
docker stop $container
docker rm $container
container_id=`docker run -d -p $ports --name $container -i $image --link db`
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
