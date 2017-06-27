#!/bin/bash
curl -XDELETE 'http://localhost:9200/mods-v3'
curl -XPUT 'http://localhost:9200/mods-v3' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "remove" : { "index" : "mods-v2", "alias" : "mods" } },
        { "add" : { "index" : "mods-v3", "alias" : "mods" } }
    ]
}'