#!/bin/bash

curl -XDELETE 'http://localhost:9200/oxford2-v1'
curl -XPUT 'http://localhost:9200/oxford2-v1' -d @common_mapping.json
curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "add" : { "index" : "oxford2-v1", "alias" : "oxford2" } }
    ]
}'
