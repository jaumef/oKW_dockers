# Utilitzar com a base: ubuntu
FROM ubuntu:latest
RUN # "=========Install oraKWlum API=========="
# Dependencies
RUN apt-get update
RUN apt-get install git bcrypt python3.5-dev python3-pip build-essential python-pip libbson-dev libsasl2-dev libssl-dev python-software-properties
# Get oKW
RUN mkdir /opt && cd /opt
RUN git clone git@github.com:gisce/oraKWlum-api-pub.git
# Python Dependencies
RUN pip install stevedore
RUN pip install /opt/oraKWlum-api-pub/requirements.txt

RUN # "=========Install Monary=========="
RUN /opt/oraKWlum-api-pub/utils/Monary.sh

RUN # "=========Set Environment Vars=========="
ENV PATHH=/opt/oraKWlum-api-pub PROCESSES=20 SOCKET=/tmp/orakwlum-api.sock

