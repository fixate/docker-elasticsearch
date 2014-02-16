FROM ubuntu:12.04
MAINTAINER Stan Bondi <stan@fixate.it>

# Add Java PPA
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

ADD ./build/ /dockerfile/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive WD=/dockerfile /dockerfile/prepare

# Install ElasticSearch.
RUN TMP_DIR=/dockerfile/tmp ES_VERSION=1.0.0 ES_DIR=/elasticsearch /dockerfile/build
# Clean up
RUN rm -rf /dockerfile

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

VOLUME ["/elasticsearch/config", "/elasticsearch/logs", "/var/elasticsearch/data", "/var/elasticsearch/data" ]
ENV ES_DATADIR "/var/elasticsearch/data"
ENV ES_TMPDIR "/var/elasticsearch/tmp"

# Define an entry point.
ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]

