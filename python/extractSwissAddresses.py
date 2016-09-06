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


result = es.search(body=request, index="cambridge-v6", doc_type="article", scroll="1m")


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
    "Journal Title",
    "First Swiss Address",
    "Institution Guess"])



#write rows for all files

counter=0
scroll_id=""
while len(result["hits"]["hits"])>0:
    for hit in result["hits"]["hits"]:
        article=hit["_source"]


        article_title=""
        if "article-title" in article:
            article_title="".join(article["article-title"])

        affiliations=""
        if "affiliations" in article:
            if isinstance(article["affiliations"], list):
                affiliations=" /// ".join(article["affiliations"])
            else:
                affiliations=article["affiliations"]

        contributor=""
        if "contributor" in article:
            if isinstance(article["contributor"], list):
                contributor=" /// ".join(article["contributor"])
            else:
                contributor=article["contributor"]


        firstSwissAddress=""
        if "better-aff1" in article:
            if isinstance(article["better-aff1"], list):
                for address in article["better-aff1"]:
                    if address.lower().find("switzerland")>=0:
                        firstSwissAddress=address

            else:
                firstSwissAddress=article["better-aff1"]

        institutionGuess=""
        if firstSwissAddress.lower().find("eth")>=0 and firstSwissAddress.lower().find("zurich")>=0:
            institutionGuess="ETH"

        if firstSwissAddress.lower().find("epfl")>=0:
            institutionGuess="EPFL"

        if firstSwissAddress.lower().find("universit")>=0 and firstSwissAddress.lower().find("basel")>=0:
            institutionGuess="University of Basel"






        article_list.writerow([
            article.get("doi",""), #"Publisher Code"
            article_title,
            contributor,
            affiliations,
            article.get("pyear",""),
            article.get("journal-title",""),
            firstSwissAddress,
            institutionGuess
        ])


    #get the next results
    scroll_id=result["_scroll_id"]
    result=es.scroll(scroll_id=scroll_id,scroll="1m")














