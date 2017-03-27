#!/bin/bash
container="backend"
image="okw/"$container
#docker rmi $image
docker build -t $image --network host .
ports="5000:5000"
./stop_backend.sh
container_id=`docker run -d -p $ports --name $container -i $image -v /tmp/docker_sockets:/tmp/`
# ./opt/oraKWlum-api-pub/utils/start_api_server.sh`
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
