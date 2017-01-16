#!/bin/bash
curl -XDELETE 'http://localhost:9200/springer-v1'
curl -XPUT 'http://localhost:9200/springer-v1' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "add" : { "index" : "springer-v1", "alias" : "all" } },
        { "add" : { "index" : "springer-v1", "alias" : "springer" } }
    ]
}'



