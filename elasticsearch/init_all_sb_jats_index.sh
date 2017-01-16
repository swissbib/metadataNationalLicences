#!/bin/bash
curl -XDELETE 'http://localhost:9200/all-sb-jats-v2'
curl -XPUT 'http://localhost:9200/all-sb-jats-v2' -d @common_mapping.json
