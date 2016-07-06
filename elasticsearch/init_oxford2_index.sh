#!/bin/bash

curl -XDELETE 'http://localhost:9200/oxford-v5'
curl -XPUT 'http://localhost:9200/oxford-v5' -d @common_mapping.json
curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "oxford-v4", "alias" : "all" } },
        { "remove" : { "index" : "oxford-v4", "alias" : "oxford" } },
        { "add" : { "index" : "oxford-v5", "alias" : "all" } },
        { "add" : { "index" : "oxford-v5", "alias" : "oxford" } }
    ]
}'
