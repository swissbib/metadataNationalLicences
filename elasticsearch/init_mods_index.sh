#!/bin/bash
#curl -XDELETE 'http://localhost:9200/mods-v4'
curl -XPUT 'http://localhost:9200/mods-v5' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "mods-v4", "alias" : "mods" } },
        { "add" : { "index" : "mods-v5", "alias" : "mods" } }
    ]
}'