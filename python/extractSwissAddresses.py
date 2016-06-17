#!/usr/bin/python
# -*- coding: utf-8 -*-

import unicodecsv as csv
import datetime
import json
from elasticsearch import Elasticsearch
import re

import locale
locale.setlocale(locale.LC_ALL, '')






# extract a csv with all swiss adresses

es = Elasticsearch()
targetDirectoryCSV = "."

# elasticsearch request
request = {
    "query" : {
        "filtered" : {
            "query": {
                "bool": {
                    "should": [
                        { "match": { "affiliations": "switzerland"   }}

                    ]
                }
            }
        }
    }
}



result = es.search(body=request, index="all", doc_type="article", scroll="1m")






#--- Extended Title List for analysis ---
filename="swissAddresses.csv"
article_list = csv.writer(open(filename, "wb+"), dialect="excel")
#csv header
article_list.writerow([
    "doi",
    "Article Title",
    "Authors",
    "Affiliations",
    "Year",
    "Journal Title"])



#write rows for all files

counter=0
scroll_id=""
while len(result["hits"]["hits"])>0:
    for hit in result["hits"]["hits"]:
        article=hit["_source"]


        article_title=""
        if article.has_key("article-title"):
            article_title="".join(article["article-title"])

        doi=""
        if article.has_key("doi"):
            doi="".join(article["doi"])

        affiliations=""
        if article.has_key("affiliations"):
            if isinstance(article["affiliations"], list):
                affiliations=" /// ".join(article["affiliations"])
            else:
                affiliations=article["affiliations"]


        author=""
        if article.has_key("author"):
            if isinstance(article["author"], list):
                author=" /// ".join(article["author"])
            else:
                author=article["author"]

        year=""
        if article.has_key("pyear"):
            year="".join(article["pyear"])


        journalTitle=""
        if article.has_key("journal-title"):
            journalTitle="".join(article["journal-title"])



        article_list.writerow([
            doi, #"Publisher Code"
            article_title,
            author,
            affiliations,
            year,
            journalTitle
        ])


    #get the next results
    scroll_id=result["_scroll_id"]
    result=es.scroll(scroll_id=scroll_id,scroll="1m")














