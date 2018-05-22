#!/bin/bash
curl -XDELETE 'http://localhost:9200/springer-v2'
curl -XPUT 'http://localhost:9200/springer-v2' -d @common_mapping.json

curl -XPOST "http://localhost:9200/_aliases" -d'
{
    "actions" : [
        { "add" : { "index" : "springer-v2", "alias" : "all" } },
        { "add" : { "index" : "springer-v2", "alias" : "springer" } },
        { "remove" : { "index" : "springer-v1", "alias" : "all" } },
        { "remove" : { "index" : "springer-v1", "alias" : "springer" } }
    ]
}'