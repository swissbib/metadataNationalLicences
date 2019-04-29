#!/bin/bash
curl -XPUT 'http://localhost:9200/springer-v5' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "add" : { "index" : "springer-v5", "alias" : "all" } },
        { "add" : { "index" : "springer-v5", "alias" : "springer" } },
        { "remove" : { "index" : "springer-v4", "alias" : "all" } },
        { "remove" : { "index" : "springer-v4", "alias" : "springer" } }
    ]
}'