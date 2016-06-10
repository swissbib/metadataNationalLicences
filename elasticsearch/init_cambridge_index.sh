#!/bin/bash
curl -XDELETE 'http://localhost:9200/cambridge-v5'
curl -XPUT 'http://localhost:9200/cambridge-v5' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "cambridge-v4", "alias" : "all" } },
        { "remove" : { "index" : "cambridge-v4", "alias" : "cambridge" } },
        { "add" : { "index" : "cambridge-v5", "alias" : "all" } },
        { "add" : { "index" : "cambridge-v5", "alias" : "cambridge" } }
    ]
}'
