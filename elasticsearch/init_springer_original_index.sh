#!/bin/bash
curl -XDELETE 'http://localhost:9200/springer-original-v1'
curl -XPUT 'http://localhost:9200/springer-original-v1' -d @springer_mapping.json


