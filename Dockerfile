FROM gitpod/openvscode-server:nightly
USER root
ENV HOME=/app
RUN apt-get update
RUN  apt-get -y install curl \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && apt-get -y install nodejs \
    && ln -s /usr/bin/nodejs /usr/local/bin/node
RUN apt remove cmdtest && apt remove yarn && npm install -g yarn
COPY /app/ /app/
WORKDIR /app
RUN yarn install
RUN chmod -R 777 /app && chmod -R 777 /home/workspace
