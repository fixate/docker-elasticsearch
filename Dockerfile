FROM phusion/baseimage:0.9.10
MAINTAINER Stan Bondi <stan@fixate.it>

ENV HOME /root

# Regenerate SSH host keys.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Add Java PPA
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

ADD ./build/ /tmp/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive WD=/tmp /tmp/prepare

# Install ElasticSearch.
RUN TMP_DIR=/tmp ES_VERSION=1.0.0 ES_DIR=/usr/lib APP=elasticsearch \
    /tmp/build

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

ENV ES_DATADIR "/var/elasticsearch/data"
ENV ES_TMPDIR "/var/elasticsearch/tmp"

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
