# elasticsearch-nextcloud-docker
A docker container hosting elasticsearch with ingest-attachment plugin enabled (compatible with NC fulltext search)

## How to use this
Basically all you have to do is to copy the `docker-compose.yml` file, create a `.env` file with the desired Elasticsearch version and then run `docker-compose up`. Of course you could also just clone this repository and apply changes to your need.

**Example:**
```bash
wget https://raw.githubusercontent.com/R0Wi/elasticsearch-nextcloud-docker/master/docker-compose.yml
echo "DOCKER_TAG=7.6.1" > .env
docker-compose up -d
```
> **Note:** you should use the `.1`-suffixed versions. See below for details.

## Versioninig
The tags in this repository will also be available on docker hub. They correspond to the elasticsearch versions.

> If there is a version missing which you might need please create a new issue. You can find all available Elasticsearch versions for docker [here](https://hub.docker.com/_/elasticsearch?tab=tags&page=1&ordering=last_updated).

## Log4j CVE-2021-44228
**Please note:** the "unofficial" versions ending with `.1` (for example `7.6.1`) already contain the patch
for `log4j` patch, mentioned at https://nvd.nist.gov/vuln/detail/CVE-2021-44228, which is basically the same
as the official one applied by the Elasticsearch community (https://github.com/elastic/elasticsearch/commit/5b38441b16b1ebb16a27c107a4c3865776e20c53). It strips out the `JndiLookup`-class from `log4j-core.jar`. Since
the official patch is only available for ES `v7.16.1` and `v6.8.21`, this repository backports the patch
to older versions, too. For
further details have a look at the `Dockerfile`.