#!/bin/bash

exec /sbin/setuser elasticsearch /elasticsearch/bin/elasticsearch >>/var/log/elasticsearch 2>&1
