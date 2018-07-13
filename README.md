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

## Indexes to be created for kadiraData:
1. `db.pubMetrics.createIndex({"value.res": 1, "value.startTime": 1})`
1. `db.pubMetrics.createIndex({"value.appId": 1, "value.res": 1, "value.startTime": 1})`
1. `db.rawPubMetrics.createIndex({"value.res": 1, "value.startTime": 1})`
1. `db.methodsMetrics.createIndex({"value.res": 1, "value.startTime": 1})`
1. `db.methodsMetrics.createIndex({"value.appId": 1, "value.res": 1, "value.startTime": 1})`
1. `db.systemMetrics.createIndex({"value.appId": 1, "value.res": 1, "value.startTime": 1})`
1. `db.rawMethodsMetrics.createIndex({"value.res": 1, "value.startTime": 1})`
1. `db.rawErrorMetrics.createIndex({"value.res": 1, "value.startTime": 1})`
1. `db.rawSystemMetrics.createIndex({"value.res": 1, "value.startTime": 1})`
