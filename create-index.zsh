#!/bin/zsh
curl -XDELETE 'http://localhost:9200/_all?pretty=true'

curl -XPOST 'http://localhost:9200/newspaper?pretty=true' -d '{
    "settings" : {
        "number_of_shards" : 5,
        "number_of_replicas": 1
    },
    "mappings" : {
        "type1" : {
            "_source" : { "enabled" : false },
            "properties" : {
                "name" : { "type" : "string", "index" : "not_analyzed" },
                "body" : { "type" : "string", "index" : "not_analyzed", "storage": false }
            }
        }
    }
}'

curl -s -XPOST localhost:9200/_bulk --data-binary @data.json

