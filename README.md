# elasticsearch-nextcloud-docker
A docker container hosting elasticsearch with ingest-attachment plugin enabled (compatible with NC fulltext search)

## How to use this
Basically all you have to do is to copy the `docker-compose.yml` file, create a `.env` file with the desired Elasticsearch version and then run `docker-compose up`. Of course you could also just clone this repository and apply changes to your need.

**Example:**
```bash
wget https://raw.githubusercontent.com/R0Wi/elasticsearch-nextcloud-docker/master/docker-compose.yml
echo "DOCKER_TAG=7.6.0" > .env
docker-compose up -d
```

## Versioninig
The tags in this repository will also be available on docker hub. They correspond to the elasticsearch versions.

> If there is a version missing which you might need please create a new issue. You can find all available Elasticsearch versions for docker [here](https://hub.docker.com/_/elasticsearch?tab=tags&page=1&ordering=last_updated).
