#!/usr/bin/python
# -*- coding: utf-8 -*-

import unicodecsv as csv
import datetime
import json
from elasticsearch import Elasticsearch
import re
import unicodedata
import sys
from datetime import datetime
from dateutil.relativedelta import relativedelta



import locale
locale.setlocale(locale.LC_ALL, '')


def match_institution(authoraff, institution):
    parts=authoraff.split("/////")
    address=unicode("","utf-8")
    if len(parts)>1:
        address=parts[1]
        if parts[len(parts)-1].lower()=="editor":
            #we only match authors, not editors
            return None;


    institutionGuess=None;



    if institution=="ethz":
        if (match(address,['eth','zurich']) or
               match(address,['eidgenossische','technische','zurich']) or
               match(address,['institute','technology', 'zurich']) or
               match(address,['ethz'])
           ):
            institutionGuess="ETH Zurich"


    if institution=="epfl":
        if (match(address,['epfl']) or
                match(address,['epf','lausanne']) or
                match(address,['eth','lausanne']) or
                match(address,['polytechni','lausanne']) or
                match(address,['fed', 'inst','lausanne']) or
                match(address,['institute','technology', 'lausanne'])
            ):
            institutionGuess="EPF Lausanne"

    if institution=="lib4ri":
        if (match(address,['paul', 'scherrer', 'villigen']) or
                match(address,['psi', 'villigen']) or
                match(address,['empa', 'dubendorf']) or
                match(address,['empa', 'duebendorf']) or
                match(address,['eawag', 'dubendorf']) or
                match(address,['eawag', 'duebendorf']) or
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
                match(address,['inst', 'physiolog', 'lausanne']) or
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

        query_terms=["switzerland","suisse","svizzera","schweiz","basel","zurich","zuerich","geneve","genf","geneva","luzern","lucerne","fribourg","gall","gallen","lugano","bellinzona","neuchatel","bern","mendrisio","bellinzona"]
        for term in query_terms:
            if (match(address,[term])):
                institutionGuess="Switzerland"
                break

    return institutionGuess







def match(someText, arrayOfStrings):
    # remove accents and umlauts and convert to lower case then do a match
    # search if someText contains all the words that begin with the strings in arrayOfStrings
    # match('University of Bern', ['uni','bern'] = yes
    # match('Munich Bern', ['uni','bern'] = no


    asciiText=unicodedata.normalize('NFD', someText).encode('ascii','ignore')
    tokens=asciiText.split()

    if len(tokens)==0:
        return 0
    else:
        result=1

        for text in arrayOfStrings:

            for token in tokens:
                textFound=0
                if token.lower().find(text)==0:
                    #text found
                    textFound=1
                    break


            if textFound==0:
                result=0
                break

        return result


def getDateEndEmbargo(source, date):
    #date is 2015 or 2015-05 or 2015-05-03
    if len(date)==4:
        date=date+"-01-01"
    elif len(date)==7:
        date=date+"-01"
    if len(date)!=10:
        return "unknown"

    try:
        publicationDate=datetime.strptime(date,'%Y-%m-%d')
    except:
        return "unknown"

    if source=='gruyter':
        dateEndEmbargo=publicationDate + relativedelta(years=0) #no embargo
    elif source=='cambridge':
        dateEndEmbargo=publicationDate + relativedelta(years=5) #5 years embargo
    elif source=='oxford':
        dateEndEmbargo=publicationDate + relativedelta(years=3) #3 years embargo
    else:
        return "unknown"
    if dateEndEmbargo < datetime.now():
        return ""
    else:
        return datetime.strftime(dateEndEmbargo, '%Y-%m-%d')



# extract a csv with all swiss adresses

es = Elasticsearch()
targetDirectoryCSV = "."

query_term="switzerland|suisse|svizzera|schweiz|basel|zurich|zürich|zuerich|geneve|genf|geneva|luzern|lucerne|fribourg|gall|gallen|lugano|bellinzona|neuchatel|neuchâtel|bern|berne|mendrisio|bellinzona"
index_to_search="mods"


request = {
    "size": 1000,
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
    "url to publisher",
    "Metadata path+filename (local)",
    "Article Title",
    "Article Subtitle",
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
    "Source",
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

#set the counters
numberOfPublications={}
for institution in institutions:
    numberOfPublications[institution]=0

while len(result["hits"]["hits"])>0:
    for hit in result["hits"]["hits"]:
        article=hit["_source"]


        article_title=""
        if "article-title" in article:
            article_title="".join(article["article-title"])

        article_subtitle=""
        if "article-subtitle" in article:
            article_subtitle="".join(article["article-subtitle"])


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
                    numberOfPublications[institution]=numberOfPublications[institution]+1
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
            "https://doi.org/"+article.get("doi",""), # "url",
            article.get("path_filename",""), # "url to download pdf (protected)",
            article_title,   # "Article Title",
            article_subtitle,   # "Article Subtitle",
            authors,   # "Authors",
            article.get("pyear",""),   # "Year",
            article.get("jtitle",""),   # "Journal Title",
            affiliations,   # "All Affiliations",
            article.get("publisher-name",""),   # "Publisher",
            getDateEndEmbargo(article.get("source",""),article.get("full-date","")),   # "Date of Allowed Open Access Publication",
            article.get("volume",""),   # "Volume",
            article.get("issue",""),   # "Issue",
            article.get("spage",""),   # "Start Page",
            article.get("lpage",""),   # "End Page",
            article.get("pissn",""),   # "ISSN (print)",
            article.get("eissn",""),   # "ISSN (electronic)",
            article.get("license-type",""),   # "Copyright type",
            article.get("license-paragraph",""),   # "Copyright / Licence",
            article.get("source",""),   # "Source",
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
            numberOfPublications["known_institution"]=numberOfPublications["known_institution"]+1
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
            numberOfPublications["unknown_institution"]=numberOfPublications["unknown_institution"]+1



    #get the next results
    scroll_id=result["_scroll_id"]
    result=es.scroll(scroll_id=scroll_id,scroll="1m")


#Print number of publis per unis

for institution in institutions:
    print institution+" : "+str(numberOfPublications[institution])+" publications"















