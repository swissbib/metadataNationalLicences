#!/usr/bin/python
# -*- coding: utf-8 -*-

import unicodecsv as csv
import datetime
import json
from elasticsearch import Elasticsearch
import re
import unicodedata

import locale
locale.setlocale(locale.LC_ALL, '')




def match(someText, arrayOfStrings):
    # remove accents and umlauts and convert to lower case then do a match

    result=1
    asciiText=unicodedata.normalize('NFD', someText).encode('ascii','ignore')

    for text in arrayOfStrings:
        if asciiText.lower().find(text)==-1:
            #text not found
            result=0
            break

    return result




# extract a csv with all swiss adresses

es = Elasticsearch()
targetDirectoryCSV = "."

query_term="switzerland"
index_to_search="cambridge-v7"

# elasticsearch request
request = {
    "query" : {
        "filtered" : {
            "query": {
                "bool": {
                    "should": [
                        { "match": { "affiliations": query_term   }}

                    ]
                }
            }
        }
    }
}


result = es.search(body=request, index=index_to_search, doc_type="article", scroll="1m")


#--- Extended Title List for analysis ---
filename=query_term+"_"+index_to_search+"_Adresses.csv"
article_list = csv.writer(open(filename, "wb+"), dialect="excel")
#csv header
article_list.writerow([
    "First "+query_term+" Address",
    "Institution Guess",
    "doi",
    "url",
    "Article Title",
    "Authors",
    "Year",
    "Journal Title",
    "All Affiliations"])



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


        firstSwissAddress=unicode("","utf-8")
        if "better-aff1" in article:
            if isinstance(article["better-aff1"], list):
                for address in article["better-aff1"]:
                    if address.lower().find(query_term)>=0:
                        firstSwissAddress=address

            else:
                firstSwissAddress=article["better-aff1"]

        institutionGuess=""
        if (match(firstSwissAddress,['eth','zurich']) or
            match(firstSwissAddress,['eidgenossische','technische','zurich']) or
            match(firstSwissAddress,['institute','technology', 'zurich']) or
            match(firstSwissAddress,['ethz'])
            ):
            institutionGuess="ETH Zurich"

        if (match(firstSwissAddress,['epfl']) or
            match(firstSwissAddress,['polytechni','lausanne']) or
            match(firstSwissAddress,['institute','technology', 'lausanne'])
            ):
            institutionGuess="EPFL"

        if (match(firstSwissAddress,['universit', 'basel']) or
            match(firstSwissAddress,['hospital', 'basel'])
            ):
            institutionGuess="University of Basel"

        if match(firstSwissAddress,['universit', 'fribourg']):
            institutionGuess="University of Fribourg"

        if (match(firstSwissAddress,['universit', 'zurich']) or
            match(firstSwissAddress,['hospital', 'zurich'])
            ):
            institutionGuess="University of Zurich"

        if (match(firstSwissAddress,['universit', 'lausanne']) or
            match(firstSwissAddress,['hospital', 'lausanne']) or
            match(firstSwissAddress,['chuv', 'lausanne'])
            ):
            institutionGuess="University of Lausanne"

        if match(firstSwissAddress,['universit', 'gall']):
            institutionGuess="University of St-Gall"

        if (match(firstSwissAddress,['universit', 'bern']) or
            match(firstSwissAddress,['hospital', 'bern']) or
                match(firstSwissAddress,['inselspital', 'bern'])
            ):
            institutionGuess="University of Bern"

        if (match(firstSwissAddress,['universit', 'lucerne']) or
            match(firstSwissAddress,['universit', 'luzern'])
            ):
            institutionGuess="University of Lucerne"

        if (match(firstSwissAddress,['universit', 'genev']) or
            match(firstSwissAddress,['hospital', 'genev'])
            ):
            institutionGuess="University of Geneva"

        article_list.writerow([
            firstSwissAddress,
            institutionGuess,
            article.get("doi",""),
            'http://dx.doi.org/'+article.get("doi",""),
            article_title,
            contributor,
            article.get("pyear",""),
            article.get("journal-title",""),
            affiliations
        ])


    #get the next results
    scroll_id=result["_scroll_id"]
    result=es.scroll(scroll_id=scroll_id,scroll="1m")















