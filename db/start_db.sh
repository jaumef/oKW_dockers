#!/bin/bash
container="db"
image="okw/"$container
docker rmi $image
docker build -t $image .
ports=""
#ports="-p 27017:27017 -p 6379:6379"
docker stop $container
docker rm $container
container_id=`docker run -d $ports --name $container -i $image`
if [ "$container_id" != "" ]
then
    echo "$container_id" > id_db
    echo "Container started! id: "$container_id
else
    if [ -e "id_frontend" ]; then
        rm id_db
    fi
    echo "Error spawning docker!"
fi
