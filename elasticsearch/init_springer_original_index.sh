#!/bin/bash
curl -XDELETE 'http://localhost:9200/springer'
curl -XPUT 'http://localhost:9200/springer' -d @springer_mapping.json


