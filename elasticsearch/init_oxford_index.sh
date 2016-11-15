#!/bin/bash

#curl -XDELETE 'http://localhost:9200/oxford-v6'
curl -XPUT 'http://localhost:9200/oxford-v7' -d @common_mapping.json
curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "oxford-v6", "alias" : "all" } },
        { "remove" : { "index" : "oxford-v6", "alias" : "oxford" } },
        { "remove" : { "index" : "oxford-v6", "alias" : "green-open-access" } },
        { "remove" : { "index" : "oxford2-v1", "alias" : "green-open-access" } },
        { "add" : { "index" : "oxford-v7", "alias" : "all" } },
        { "add" : { "index" : "oxford-v7", "alias" : "green-open-access" } },
        { "add" : { "index" : "oxford-v7", "alias" : "oxford" } }
    ]
}'
