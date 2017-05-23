#!/usr/bin/python
# -*- coding: utf-8 -*-

import unicodecsv as csv
import datetime
import json
from elasticsearch import Elasticsearch
import re
import unicodedata
import sys

import locale
locale.setlocale(locale.LC_ALL, '')


def match_institution(authoraff, institution):
    parts=authoraff.split("/////")
    address=unicode("","utf-8")
    if len(parts)>1:
        address=parts[1]

    institutionGuess=None;



    if institution=="ethz":
        if (match(address,['eth','zurich']) or
               match(address,['eidgenossische','technische','zurich']) or
               match(address,['institute','technology', 'zurich']) or
               match(address,['ethz'])
           ):
            institutionGuess="ETH Zurich"

    #max planck regex
    # if institution=="ethz":
    #     asciiText=unicodedata.normalize('NFD', address).encode('ascii','ignore').lower()
    #     result=re.match("eth z(ue|ü|u|ú)rich|[: ]eth[z]*[:]|^eth[z]*|eth[z]*$|e\.t\.h\.z|'e\.t\.h|(eidg|eichg|e[li]dg|eigen).*techn.*hochsch.*z(ue|ü|u|ú)rich|fed.*inst.*technol.*z(ue|ü|u|ú)rich|(eidg|eichg|e[li]dg|eigen).*([: ]th[z]*[: ]|th[z]*$)",asciiText)
    #     if result:
    #         institutionGuess="ETH Zurich"

    if institution=="epfl":
        if (match(address,['epfl']) or
                match(address,['polytechni','lausanne']) or
                match(address,['institute','technology', 'lausanne'])
            ):
            institutionGuess="EPF Lausanne"

    if institution=="lib4ri":
        if (match(address,['paul', 'scherrer', 'villigen']) or
                match(address,['empa', 'bendorf']) or
                match(address,['eawag', 'bendorf']) or
                match(address,['wsl', 'davos'])
            ):
            institutionGuess="LIB4RI"


    if institution=="unibas":
        if (match(address,['universit', 'basel']) or
                match(address,['hospital', 'basel']) or
                match(address,['friedrich', 'miescher', 'basel']) or
                match(address,['tropical', 'institute', 'basel'])
            ):
            institutionGuess="University of Basel"

    if institution=="unifr":
        if match(address,['universit', 'fribourg']):
            institutionGuess="University of Fribourg"

    if institution=="uzh":
        if (match(address,['universit', 'zurich']) or
                match(address,['hospital', 'zurich'])
            ):
            institutionGuess="University of Zurich"

    if institution=="unil":
        if (match(address,['universit', 'lausanne']) or
                match(address,['hospital', 'lausanne']) or
                match(address,['chuv', 'lausanne'])
            ):
            institutionGuess="University of Lausanne"

    if institution=="unisg":
        if match(address,['universit', 'gall']):
            institutionGuess="University of St-Gall"

    if institution=="unine":
        if match(address,['universit', 'neuchatel']):
            institutionGuess="University of Neuchatel"

    if institution=="unibe":
        if (match(address,['universit', 'bern']) or
                match(address,['hospital', 'bern']) or
                match(address,['inselspital', 'bern'])
            ):
            institutionGuess="University of Bern"

    if institution=="unilu":
        if (match(address,['universit', 'lucerne']) or
                match(address,['universit', 'luzern'])
            ):
            institutionGuess="University of Lucerne"

    if institution=="unige":
        if (match(address,['universit', 'genev']) or
                match(address,['hospital', 'genev'])
            ):
            institutionGuess="University of Geneva"

    if institution=="usi":
        if (match(address,['usi', 'lugano']) or
                match(address,['usi', 'mendrisio']) or
                match(address,['universit', 'lugano']) or
                match(address,['accademia', 'architettura']) or
                match(address,['accad', 'arch', 'mendrisio']) or
                match(address,['istituto', 'molle', 'studi', 'intelligen', 'artificial']) or
                match(address,['institute', 'molle', 'stud', 'intelligen', 'artificial']) or
                match(address,['idsia', 'manno']) or
                match(address,['irb', 'bellinzona']) or
                match(address,['istituto', 'ricerca', 'biomedicina', 'bellinzona']) or
                match(address,['institute', 'research', 'biomedicine', 'bellinzona'])
            ):
            institutionGuess="Università della Svizzera italiana"

    if institution=="switzerland":
        if (match(address,['switzerland'])):
            institutionGuess="Switzerland"

    return institutionGuess







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

query_term="(switzerland|suisse|svizzera|schweiz|basel|zurich|zürich|zuerich|geneve|genf|geneva|luzern|lucerne|fribourg|gall|gallen|lugano|bellinzona|neuchatel|neuchâtel|bern|berne|mendrisio|bellinzona)"
index_to_search="mods-v1"


request = {
    "query": {
        "bool": {
            "must": [
                { "regexp": { "affiliations": query_term   }},
            ]
        }
    }
}


result = es.search(body=request, index=index_to_search, doc_type="article", scroll="1m")

columns=[
    "First Matching Affiliation",
    "First Matching Author",
    "Institution Guess",
    "doi",
    "Metadata path+filename",
    "Article Title",
    "Authors",
    "Year",
    "Journal Title",
    "All Affiliations",
    "Publisher",
    "Date of Allowed Open Access Publication",
    "Volume",
    "Issue",
    "Start Page",
    "End Page",
    "ISSN (print)",
    "ISSN (electronic)",
    "Copyright type",
    "Copyright / Licence",
    "Link to Swissbib",
    "Metadata in MARC XML",
    "Metadata in Dublin Core",
    "Metadata in Json-Marc",
    "Comment"
]

institutions=[
    "epfl",
    "ethz",
    "lib4ri",
    "unibas",
    "unibe",
    "unifr",
    "unige",
    "unil",
    "unilu",
    "unine",
    "unisg",
    "usi",
    "uzh",
    "known_institution",
    "unknown_institution"
]


#--- Extended Title List for analysis ---
files={} #files["epfl"] is the file containing EPFL publications

for institution in institutions:
    filename="../swiss-publications-lists/"+institution+".csv"
    files[institution] = csv.writer(open(filename, "wb+"), dialect="excel")

    #csv header
    files[institution].writerow(columns)



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
                affiliations=";".join(article["affiliations"])
            else:
                affiliations=article["affiliations"]

        authors=""
        if "authors" in article:
            if isinstance(article["authors"], list):
                authors=";".join(article["authors"])
            else:
                authors=article["authors"]




        institutionGuess=[]
        addresses=[]
        matchingAuthorAff={}

        if isinstance(article["author-aff"], list):
            addresses=article["author-aff"]
        else:
            addresses=(article["author-aff"])


        for institution in institutions:
            for address in addresses:
                if match_institution(address, institution):
                    institutionGuess.append(institution)
                    matchingAuthorAff[institution]=address
                    break


        idForSru=re.sub(r'\W+', '', hit["_id"])
        sruBegin="http://sru.swissbib.ch/sru/search/defaultdb?query=+dc.anywhere+exact+NATIONALLICENCE"
        sruMiddle="&operation=searchRetrieve&recordSchema=info%3Asrw%2Fschema%2F"
        sruMiddleJSON="&operation=searchRetrieve&recordSchema=info%3Asru%2Fschema%2F"
        sruEnd="&maximumRecords=10&startRecord=0&recordPacking=XML&availableDBs=defaultdb&sortKeys=Submit+query"
        swissbibBegin="https://www.swissbib.ch/Search/Results?lookfor=nationallicence"
        row=[
            "", # "First Matching Affiliation"
            "", # "First Matching Author"
            "", # "Institution Guess"
            article.get("doi",""), # "doi",
            article.get("path_filename",""), # "url to download pdf (protected)",
            article_title,   # "Article Title",
            authors,   # "Authors",
            article.get("pyear",""),   # "Year",
            article.get("journal-title",""),   # "Journal Title",
            affiliations,   # "All Affiliations",
            article.get("publisher-name",""),   # "Publisher",
            "",   # "Date of Allowed Open Access Publication",
            article.get("volume",""),   # "Volume",
            article.get("issue",""),   # "Issue",
            article.get("spage",""),   # "Start Page",
            article.get("lpage",""),   # "End Page",
            article.get("pissn",""),   # "ISSN (print)",
            article.get("eissn",""),   # "ISSN (electronic)",
            article.get("license-type",""),   # "Copyright type",
            article.get("license-paragraph",""),   # "Copyright / Licence",
            swissbibBegin+idForSru, #"Link to Swissbib",
            sruBegin+idForSru+sruMiddle+"1%2Fmarcxml-v1.1-light"+sruEnd,   # "Metadata in MARC XML",
            sruBegin+idForSru+sruMiddle+"1%2Fdc-v1.1-light"+sruEnd,   # "Metadata in Dublin Core",
            sruBegin+idForSru+sruMiddleJSON+"json"+sruEnd,   # "Metadata in Json-Marc",
            ""   # "Comment"
        ]
        if(institutionGuess):
            for institution in institutionGuess:
                matchingAuthor=matchingAuthorAff[institution].split("/////")[0]
                matchingAffiliation=matchingAuthorAff[institution].split("/////")[1]
                row[0]=matchingAffiliation
                row[1]=matchingAuthor
                row[2]=institution
                files[institution].writerow(row)
            files["known_institution"].writerow(row)
        else:
            swissAuthorAff=""
            matchingAuthor=""
            matchingAffiliation=""
            for address in addresses:
                if match_institution(address, "switzerland"):
                    swissAuthorAff=address
                    matchingAuthor=swissAuthorAff.split("/////")[0]
                    matchingAffiliation=swissAuthorAff.split("/////")[1]
                    break
            row[0]=matchingAffiliation
            row[1]=matchingAuthor
            files["unknown_institution"].writerow(row)



    #get the next results
    scroll_id=result["_scroll_id"]
    result=es.scroll(scroll_id=scroll_id,scroll="1m")















