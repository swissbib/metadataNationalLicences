#!/bin/bash
curl -XDELETE 'http://localhost:9200/oxford-original'
curl -XPUT 'http://localhost:9200/oxford-original' -d @common_mapping_full.json

