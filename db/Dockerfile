# Utilitzar com a base: ubuntu
FROM ubuntu:latest

# Install Mongo 3.2
RUN # echo "==========INSTALL MONGODB (3.2)=========="
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org

#     Create Mongo directory
RUN mkdir -p /data/db

#     Expose Mongo Port
# EXPOSE 27017 // No need if using --link

#     Set entrypoint for mongod
RUN echo "/usr/bin/mongod" >> /bin/bash.bashrc

# Install Redis
RUN # echo "=========INSTALL REDIS=========="
RUN apt-get update && apt-get install -y redis-server

#     Expose REDIS Port
# EXPOSE 6379 // No need if using --link

#     Set entrypoint for redis-server
RUN echo "/usr/bin/redis-server" >> /bin/bash.bashrc

# Set entrypoint as bash.  
# This will run bash with the binaries added before
ENTRYPOINT ["/bin/bash"]

