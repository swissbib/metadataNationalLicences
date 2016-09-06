#!/bin/bash
curl -XDELETE 'http://localhost:9200/gruyter-v6'
curl -XPUT 'http://localhost:9200/gruyter-v6' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "gruyter-v5", "alias" : "all" } },
        { "remove" : { "index" : "gruyter-v5", "alias" : "gruyter" } },
        { "add" : { "index" : "gruyter-v6", "alias" : "all" } },
        { "add" : { "index" : "gruyter-v6", "alias" : "gruyter" } }
    ]
}'
