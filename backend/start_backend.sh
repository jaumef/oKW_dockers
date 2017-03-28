#!/bin/bash
container="backend"
image="okw/"$container
#docker rmi $image
docker build -t $image --network host .
ports="-p 5000:5000"
./stop_backend.sh
container_id=`docker run -d $ports --name $container -v /tmp/docker_sockets:/tmp/ --network host -i $image`
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
