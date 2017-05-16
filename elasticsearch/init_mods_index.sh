#!/bin/bash
curl -XDELETE 'http://localhost:9200/mods-v1'
curl -XPUT 'http://localhost:9200/mods-v1' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "add" : { "index" : "mods-v1", "alias" : "mods" } }
    ]
}'
