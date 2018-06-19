# Start the services

1. Create user with read/write permission for kadiraData and kadiraApps in mongo
1. In kadiraData add following docs
```
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'1min',provider:'methods',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'1min',provider:'errors',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'1min',provider:'pubsub',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'1min',provider:'system',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'3hour',provider:'methods',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'3hour',provider:'errors',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'3hour',provider:'pubsub',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'3hour',provider:'system',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'30min',provider:'methods',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'30min',provider:'errors',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'30min',provider:'pubsub',shard:"one"}})
db.mapReduceProfileConfig.insert({lastTime: new Date(), _id:{profile:'30min',provider:'system',shard:"one"}})
```
1. Fill the environment variables in docker-compose.yml
1. Run `docker-compose up`
1. Go to the <IP>:8000 and login with email - admin@kadira.com, passwd - admin.

# Kadira APM

This is a set of components you need to run Kadira in your system.

> The following instructions are not production deployment configurations. It's meant for running for testing.

## Initial Setup

Open `init-shell.sh` and update configurations.
Make sure to set fresh DB configurations before getting started.

Then run following three components by visiting their directories:

* kadira-engine
* kadira-rma
* kadira-ui

## Connecting with Kadira Agent

You you are ready to connect your app into Kadira. Since we are running with a custom setup, you need to export following environment variable before using Kadira in your app:

```
export KADIRA_OPTIONS_ENDPOINT=http://localhost:11011
```

> Here's we've assumed http://localhost:11011 as the kadira-engine URL.
