# Utilitzar com a base: node
FROM node:release
# Clone repository
RUN mkdir -p /opt
RUN cd /opt && git clone https://github.com/gisce/oraKWlum-frontend.git 
# Install node dependencies
RUN cd /opt/oraKWlum-frontend && npm install
# Build page
RUN cd /tmp/node/oraKWlum-frontend && ./utils/build.sh
# Copy page to nginx output
RUN rm -rf /var/www
RUN cp -r /opt/oraKWlum-frontend/www /var/www
# Give read permissions to everyone for var/www
RUN chmod -R +r /var/www
# Install nginx
RUN apt-get update
RUN apt-get install build-essential nginx
# Set nginx config file
RUN cp /opt/oraKWlum-frontend/conf/production.conf /etc/nginx/sites-enabled/default
# Expose HTTP Contents
EXPOSE 80
EXPOSE 443
