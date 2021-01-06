ARG ELASTIC_IMAGE=elasticsearch:7.5.0

FROM $ELASTIC_IMAGE
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch ingest-attachment