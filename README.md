# elasticsearch-nextcloud-docker
A docker container hosting elasticsearch with ingest-attachment plugin enabled (compatible with NC fulltext search)

## How to use this
Basically all you have to do is to copy the `docker-compose.yml` file, adjust the container version to you needs and then run `docker-compose up`. 

**Example:**
```bash
wget https://raw.githubusercontent.com/R0Wi/elasticsearch-nextcloud-docker/master/docker-compose.yml
docker-compose up -d
```

```yaml
version: '2.2'
services:
  elasticsearch:
    image: r0wi/elasticsearch-nextcloud-docker:7.6.0 # <-- you might want to change this version
    container_name: elasticsearch_nc
    restart: always
    environment:
      - cluster.name=docker-cluster
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
      - discovery.type=single-node
    ulimits:
      memlock:
        soft: -1
        hard: -1
    volumes:
      - ./data:/usr/share/elasticsearch/data
    ports:
      - 127.0.0.1:9200:9200
```

## Versioninig
The tags in this repository will also be available on docker hub. They correspond to the elasticsearch versions.
