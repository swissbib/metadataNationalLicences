#!/bin/bash
curl -XDELETE 'http://localhost:9200/cambridge-v6'
curl -XPUT 'http://localhost:9200/cambridge-v6' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "cambridge-v5", "alias" : "all" } },
        { "remove" : { "index" : "cambridge-v5", "alias" : "cambridge" } },
        { "add" : { "index" : "cambridge-v6", "alias" : "all" } },
        { "add" : { "index" : "cambridge-v6", "alias" : "cambridge" } }
    ]
}'
