#!/bin/bash
curl -XDELETE 'http://localhost:9200/gruyter-v5'
curl -XPUT 'http://localhost:9200/gruyter-v5' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "gruyter-v4", "alias" : "all" } },
        { "remove" : { "index" : "gruyter-v4", "alias" : "gruyter" } },
        { "add" : { "index" : "gruyter-v5", "alias" : "all" } },
        { "add" : { "index" : "gruyter-v5", "alias" : "gruyter" } }
    ]
}'
