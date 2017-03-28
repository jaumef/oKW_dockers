# Utilitzar com a base: ubuntu
FROM ubuntu:latest
RUN # "=========Install oraKWlum API=========="
# Dependencies
RUN apt-get update
RUN apt-get install -y git bcrypt python3.5-dev python3-pip build-essential libbson-dev libsasl2-dev libssl-dev python-software-properties
RUN ln -s /usr/bin/pip3 /usr/bin/pip
# Get oKW
#	Add required SSH keys from HOST
RUN apt-get -y install ssh
RUN mkdir -p ~/.ssh
ADD ["ssh/id_rsa", "/root/.ssh/id_rsa"]
ADD ["ssh/id_rsa.pub", "/root/.ssh/id_rsa.pub"]
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
#	Clone repository
RUN cd /opt && git clone git@github.com:gisce/oraKWlum-api-pub.git
# Python Dependencies
RUN pip install --upgrade pip
RUN pip install stevedore
# Install Monary dependency
RUN mkdir -p /root/src
RUN cd /root/src && rm -fR mongo-c-dr*
RUN cd /root/src && wget https://github.com/mongodb/mongo-c-driver/releases/download/1.5.0/mongo-c-driver-1.5.0.tar.gz
RUN cd /root/src && tar xfzp mongo-c-dr*
RUN cd /root/src/mongo-c-driver* && ./configure --enable-ssl=yes --enable-sasl=yes
RUN cd /root/src/mongo-c-driver* && make
RUN cd /root/src/mongo-c-driver* && make test
RUN cd /root/src/mongo-c-driver* && make install
RUN ln -s /usr/local/lib/lib* /usr/lib/
RUN pip install monary==0.5.0
# Install python requirements from api repository
RUN pip install -r /opt/oraKWlum-api-pub/requirements.txt
# Set Read permissions on api repository
RUN chmod -R 777 /opt/oraKWlum-api-pub
# RUN chmod -R +x /opt/oraKWlum-api-pub/application
# Set Environment Vars
ENV PATHH=/opt/oraKWlum-api-pub PROCESSES=20 SOCKET=/tmp/orakwlum-api.sock
# Set runnable to start
RUN echo "uwsgi -s $SOCKET --manage-script-name --chdir $PATHH --mount /=main:app --thunder-lock -p $PROCESSES --enable-threads" > run_server.sh
RUN chmod +rx run_server.sh
ENTRYPOINT /run_server.sh
