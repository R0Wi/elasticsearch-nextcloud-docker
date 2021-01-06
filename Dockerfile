ARG image

FROM $image
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch ingest-attachment