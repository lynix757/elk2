### Test Build
- elk2
  |- elasticsearch
    |- Dockerfile
    |- start
  |- kibana
    |- Dockerfile
    |- start
  
### Build
cd kibana
chmod +x start
docker build -t lynix757/kibana-6.5.4 .

cd elasticsearch
chmod +x start
docker build -t lynix757/es-6.5.4 .


### Run
docker network create elk

docker run -d --name es0 --net=elk -p 9200:9200 lynix757/es-6.5.4
docker run -d --name es1 --net=elk --link es0 -e UNICAST_HOSTS=es0 lynix757/es-6.5.4
docker run -d --name es2 --net=elk --link es0 -e UNICAST_HOSTS=es0 lynix757/es-6.5.4

docker run -d --name kibana --net=elk --link es0 -p 5601:5601 lynix757/kibana-6.5.4

### Test Cluster
curl http://127.0.0.1:9200/_cluster/health?pretty
