# elasticsearch-nextcloud-docker
A docker container hosting elasticsearch with ingest-attachment plugin enabled (compatible with NC fulltext search)

## How to use this
Basically all you have to do is to copy the `docker-compose.yml` file, create a `.env` file with the desired Elasticsearch version and then run `docker-compose up`. Of course you could also just clone this repository and apply changes to your need.

**Example:**

```bash
wget https://raw.githubusercontent.com/R0Wi/elasticsearch-nextcloud-docker/master/docker-compose.yml
echo "DOCKER_TAG=8.6.1" > .env
docker-compose up -d
```

Alternatively you can also use the `docker run` command:

```bash
docker run -d \
    -v elastic_data:/usr/share/elasticsearch/data \
    -p 127.0.0.1:9200:9200 \
    -e "cluster.name=docker-cluster" \
    -e "bootstrap.memory_lock=true" \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "discovery.type=single-node" \
    -e "xpack.security.enabled=false" \
    --restart always \
    r0wi/elasticsearch-nextcloud-docker:8.6.1
```

If you need additional information, please refer to the official docs:

* https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
* https://hub.docker.com/_/elasticsearch

## Authentication

To setup Basic Authentication for the [built-in user `elastic`](https://www.elastic.co/guide/en/elasticsearch/reference/current/built-in-users.html), adjust the environment variables as follows:

```yaml
    environment:
      - cluster.name=docker-cluster
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
      - discovery.type=single-node
      - xpack.security.enabled=true
      - xpack.security.http.ssl.enabled=false
      - ELASTIC_PASSWORD=mySuperSecret
```

To authenticate against your ES instance, you could for example embed the credentials into your url like this: http://elastic:mySuperSecret@localhost:9200/myindex. See https://www.elastic.co/guide/en/elasticsearch/reference/current/security-minimal-setup.html for more details.

## Versioninig
The tags in this repository will also be available on docker hub. They correspond to the elasticsearch versions.

> If there is a version missing which you might need please create a new issue. You can find all available Elasticsearch versions for docker [here](https://hub.docker.com/_/elasticsearch?tab=tags&page=1&ordering=last_updated).

## Log4j CVE-2021-44228
**Please note:** the "unofficial" version `7.6.1` already contains the patch
for `log4j` patch, mentioned at https://nvd.nist.gov/vuln/detail/CVE-2021-44228, which is basically the same
as the official one applied by the Elasticsearch community (https://github.com/elastic/elasticsearch/commit/5b38441b16b1ebb16a27c107a4c3865776e20c53). It strips out the `JndiLookup`-class from `log4j-core.jar`. Since
the official patch is only available for ES `v7.16.1` and `v6.8.21`, this repository backports the patch
to the older version `7.6.1`, too. For
further details have a look at the [`Dockerfile`](https://github.com/R0Wi/elasticsearch-nextcloud-docker/blob/7.6.1/Dockerfile).