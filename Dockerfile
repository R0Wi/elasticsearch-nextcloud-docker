ARG ELASTIC_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:latest

FROM $ELASTIC_IMAGE
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch ingest-attachment