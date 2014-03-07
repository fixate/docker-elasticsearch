#!/bin/bash
set -eo pipefail

[ -z $ES_LOGDIR ] && ES_LOGDIR=/var/elasticsearch/logs
exec /usr/lib/elasticsearch/bin/elasticsearch >> $ES_LOGDIR/elasticsearch.log 2>&1
