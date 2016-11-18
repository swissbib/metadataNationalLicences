#!/bin/bash
curl -XDELETE 'http://localhost:9200/cambridge-original'
curl -XPUT 'http://localhost:9200/cambridge-original' -d @common_mapping_full.json

