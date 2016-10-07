#!/bin/bash
curl -XDELETE 'http://localhost:9200/gruyter-original'
curl -XPUT 'http://localhost:9200/gruyter-original' -d @common_mapping_full.json

