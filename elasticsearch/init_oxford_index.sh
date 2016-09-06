#!/bin/bash

curl -XDELETE 'http://localhost:9200/oxford-v6'
curl -XPUT 'http://localhost:9200/oxford-v6' -d @common_mapping.json
curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "oxford-v5", "alias" : "all" } },
        { "remove" : { "index" : "oxford-v5", "alias" : "oxford" } },
        { "add" : { "index" : "oxford-v6", "alias" : "all" } },
        { "add" : { "index" : "oxford-v6", "alias" : "oxford" } }
    ]
}'
