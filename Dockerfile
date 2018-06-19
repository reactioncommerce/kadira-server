FROM keymetrics/pm2:8-jessie

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential curl sudo mongodb-org-shell git vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR /home/node

ENV ENGINE_PORT 11011
ENV UI_PORT 8000
ENV UI_URL http://localhost:$UI_PORT
ENV MONGO_SHARD one
ENV METEOR_VERSION 1.6.1

RUN curl https://install.meteor.com/?release=$METEOR_VERSION | sh
ENV PATH $PATH:/home/node/.meteor

RUN git clone https://github.com/reactioncommerce/kadira-server.git
RUN chmod +x kadira-server/init-shell.sh
RUN npm install --prefix kadira-server/kadira-engine
RUN chmod +x kadira-server/kadira-engine/run.sh
RUN npm install --prefix kadira-server/kadira-rma
RUN chmod +x kadira-server/kadira-rma/run.sh

WORKDIR kadira-server/kadira-ui
# RUN mv packages packages.tmp && mv packages.tmp packages
RUN chmod +x run.sh
RUN meteor npm install --save bcrypt
RUN meteor npm install --save @babel/runtime
RUN meteor add ecmascript@=0.7.3 ejson@=1.0.13 logging@=1.1.17 meteor@=1.6.1 shell-server@=0.2.3 standard-minifier-js@=2.0.0 mobile-experience@=1.0.4 --allow-incompatible-update
RUN meteor npm install

EXPOSE $UI_PORT $ENGINE_PORT

WORKDIR /home/node
CMD [ "pm2-runtime", "kadira-server/kadira.json"]