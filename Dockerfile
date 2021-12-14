ARG ELASTIC_IMAGE=elasticsearch:7.16.1

FROM $ELASTIC_IMAGE

# https://nvd.nist.gov/vuln/detail/CVE-2021-44228
RUN zip -q -d /usr/share/elasticsearch/lib/log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch ingest-attachment