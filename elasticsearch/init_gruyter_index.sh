#!/bin/bash
curl -XDELETE 'http://localhost:9200/gruyter-v1'
curl -XPUT 'http://localhost:9200/gruyter-v1' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "add" : { "index" : "gruyter-v1", "alias" : "gruyter" } }
    ]
}'
