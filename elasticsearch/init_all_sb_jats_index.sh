#!/bin/bash
curl -XDELETE 'http://localhost:9200/all-sb-jats-v1'
curl -XPUT 'http://localhost:9200/all-sb-jats-v1' -d @common_mapping.json
