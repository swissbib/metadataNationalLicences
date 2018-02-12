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
import os

import doisToSkip
import doisReroDocUrl


import locale
locale.setlocale(locale.LC_ALL, '')


def match_institution(authoraffrole, institution):
    parts=authoraffrole.split("/////")
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
               match(address,['ethz']) or
               matchEmail(address,'ethz.ch')
           ):
           institutionGuess="ETH Zurich"


    if institution=="epfl":
        if (match(address,['epfl']) or
                match(address,['epf','lausanne']) or
                match(address,['eth','lausanne']) or
                match(address,['polytechni','lausanne']) or
                match(address,['fed', 'inst','lausanne']) or
                match(address,['institute','technology', 'lausanne']) or
                matchEmail(address,'epfl.ch')
            ):
            institutionGuess="EPF Lausanne"

    if institution=="lib4ri":
        if (match(address,['paul', 'scherrer']) or
                match(address,['psi', 'villigen']) or
                match(address,['empa', 'dubendorf']) or
                match(address,['empa', 'duebendorf']) or
                match(address,['empa', 'thun']) or
                match(address,['empa', 'gall']) or
                match(address,['eawag', 'dubendorf']) or
                match(address,['eawag', 'duebendorf']) or
                match(address,['eawag', 'kastanienbaum']) or
                match(address,['aquatic', 'dubendorf']) or
                match(address,['aquatic', 'duebendorf']) or
                match(address,['water', 'dubendorf']) or
                match(address,['water', 'duebendorf']) or
                match(address,['wasser', 'dubendorf']) or
                match(address,['wasser', 'duebendorf']) or
                match(address,['snow', 'davos']) or
                match(address,['schnee', 'davos']) or
                match(address,['forest', 'snow', 'landscape']) or
                match(address,['wald', 'schnee', 'landschaft']) or
                match(address,['birmensdorf'])
            ):
            institutionGuess="LIB4RI"


    if institution=="unibas":
        if (match(address,['universit', 'basel']) or
                match(address,['hospital', 'basel']) or
                match(address,['kantonsspital', 'basel']) or
                match(address,['biozentrum', 'basel']) or
                match(address,['friedrich', 'miescher', 'basel']) or
                match(address,['tropical', 'institute', 'basel']) or
                match(address,['universit', 'basle']) or
                match(address,['hospital', 'basle']) or
                match(address,['friedrich', 'miescher', 'basle']) or
                match(address,['tropical', 'institute', 'basle']) or
                match(address,['immunology', 'institute', 'basel']) or
                matchEmail(address,'unibas.ch')
            ):
            institutionGuess="University of Basel"

    if institution=="unifr":
        if match(address,['universit', 'fribourg'] or
                matchEmail(address,'unifr.ch')):
            institutionGuess="University of Fribourg"

    if institution=="uzh":
        if (match(address,['universit', 'zurich']) or
                match(address,['hospital', 'zurich']) or
                matchEmail(address,'uzh.ch')
            ):
            institutionGuess="University of Zurich"

    if institution=="unil":
        if (match(address,['universit', 'lausanne']) or
                match(address,['hospital', 'lausanne']) or
                match(address,['inst', 'physiolog', 'lausanne']) or
                match(address,['chuv', 'lausanne']) or
                matchEmail(address,'unil.ch') or
                matchEmail(address,'chuv.ch')
            ):
            institutionGuess="University of Lausanne"

    if institution=="unisg":
        if match(address,['universit', 'gall']  or
                matchEmail(address,'unisg.ch')):
            institutionGuess="University of St-Gall"

    if institution=="unine":
        if match(address,['universit', 'neuchatel']  or
                matchEmail(address,'unine.ch')):
            institutionGuess="University of Neuchatel"

    if institution=="unibe":
        if (match(address,['universit', 'bern']) or
                match(address,['hospital', 'bern']) or
                match(address,['inselspital', 'bern']) or
                matchEmail(address,'unibe.ch') or
                matchEmail(address,'insel.ch')
            ):
            institutionGuess="University of Bern"

    if institution=="unilu":
        if (match(address,['universit', 'lucerne']) or
                match(address,['universit', 'luzern'])  or
                matchEmail(address,'unilu.ch')
            ):
            institutionGuess="University of Lucerne"

    if institution=="unige":
        if (match(address,['universit', 'genev']) or
                match(address,['hospital', 'genev']) or
                match(address,['observa', 'sauverny']) or
                match(address,['observa', 'versoix']) or
                match(address,['astrophy', 'versoix']) or
                match(address,['astrophy', 'sauverny']) or
                match(address,['cmu', 'genev']) or
                matchEmail(address,'unige.ch')
            ):
            institutionGuess="University of Geneva"

    if institution=="usi":
        if (match(address,['usi', 'lugano']) or
                match(address,['usi', 'mendrisio']) or
                match(address,['universit', 'lugano']) or
                match(address,['universit', 'svizzera', 'italiana']) or
                match(address,['accademia', 'architettura']) or
                match(address,['accad', 'arch', 'mendrisio']) or
                match(address,['acc', 'arch', 'usi']) or
                match(address,['istituto', 'molle', 'studi', 'intelligen', 'artificial']) or
                match(address,['institute', 'molle', 'stud', 'intelligen', 'artificial']) or
                match(address,['idsia', 'manno']) or
                match(address,['irb', 'bellinzona']) or
                match(address,['istituto', 'ricerca', 'biomedicina', 'bellinzona']) or
                match(address,['institute', 'research', 'biomedicine', 'bellinzona']) or
                matchEmail(address,'usi.ch')
            ):
            institutionGuess="Università della Svizzera italiana"

    if institution=="fachhochschulen":
        if (match(address,['fachhochschule']) or
                match(address,['universit', 'applied', 'sciences']) or
                match(address,['haute', 'ecole', 'specialis']) or
                match(address,['hochschule', 'angewandte', 'wissenschaft'])
            ):
            institutionGuess="Fachhochschulen/Hautes Ecoles spécialisées"

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
    # match('University of Bern', ['uni','bern']) = yes
    # match('Munich Bern', ['uni','bern']) = no


    #replace special unicode-apostrophe by space (the NFD transformation doesn't transform that)
    someText=someText.replace(u"’", " ")


    asciiText=unicodedata.normalize('NFD', someText).encode('ascii','ignore')

    asciiText=asciiText.lower()
    asciiText=asciiText.replace("e.p.f.l", "epfl")
    asciiText=asciiText.replace("e.t.h.z", "ethz")
    asciiText=asciiText.replace("e.t.h", "eth")
    asciiText=asciiText.replace("-", " ")
    asciiText=asciiText.replace("'", " ")
    asciiText=asciiText.replace("(", " ")
    asciiText=asciiText.replace(")", " ")


    tokens=asciiText.split()

    if len(tokens)==0:
        return 0
    else:
        result=1

        for text in arrayOfStrings:

            for token in tokens:
                textFound=0
                if token.startswith(text):
                    #text found
                    textFound=1
                    break


            if textFound==0:
                result=0
                break

        return result

def matchEmail(affiliation, emailDomain):
    #matchEmail("Laboratory for Human Nutrition, I... davidsson@ilw.agrl.ethz.ch", "ethz.ch") returns yes
    tokens=affiliation.split()
    for token in tokens:
        if '@' in token:
            domain=""
            result=re.search('([a-z]*\.ch)$',token)
            if (result):
                domain=result.group(1)
            if domain==emailDomain:
                return True
            else:
                return False


def getUrl(doi):
    if doisReroDocUrl.reroDocFulltextUrl.has_key(doi):
        return doisReroDocUrl.reroDocFulltextUrl[doi]
    else:
        return ""


def getPath(source, path, journalId=""):
    base_path="/media/lionel/USB/fulltexts/" + source + "/"
    if(source=="cambridge"):
        #remove the a in the pdf S0022050700009268a.pdf
        pdfname=os.path.basename(path)
        pdfname=pdfname.replace("h.xml",".pdf")
        return base_path+pdfname
    if(source=="oxford"):
        pdfname=os.path.basename(path)
        pdfname=pdfname.replace("xml","pdf")
        return base_path+journalId+"/"+pdfname
    if(source=="gruyter"):
        pdfname=os.path.basename(path)
        path=path.replace("./j/","j/")
        path=path.replace(".xml",".pdf")
        return base_path+path


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
    elif source=='springer':
        dateEndEmbargo=publicationDate + relativedelta(years=5) #5 years embargo
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
index_to_search="springer"


request = {
    "size": 1000,
    "query": {
        "bool": {
            "must": [
                { "range" : { "pyear" : {"lte" : 2012}}},
                { "range" : { "pyear" : {"gte" : 1997}}},
                { "regexp": { "contrib-affiliations": query_term   }},
                #{ "match": { "doi": "10.1017/S1743921313008740"   }},
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
    "Url to publisher",
    "Url to fulltext in Rero Doc",
    "Article Title",
    "Article Subtitle",
    "Authors",
    "Year",
    "Journal Title",
    "All Affiliations",
    "Publisher",
    "Date of Allowed Open Access Publication (YYYY-MM-DD)",
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
    "fachhochschulen",
    "known_institution",
    "unknown_institution",
    "all_publications"
]


#--- Extended Title List for analysis ---
files={} #files["epfl"] is the file containing EPFL publications

for institution in institutions:
    filename="../swiss-publications-lists-springer/"+institution+".csv"
    files[institution] = csv.writer(open(filename, "wb+"), dialect="excel")

    #csv header
    files[institution].writerow(columns)


rerodoc_file=csv.writer(open("../swiss-publications-lists-springer/rerodoc.csv", "wb+"), dialect="excel")
rerodoc_file.writerow([
    "id (035a which stats with (NATIONALLICENCE))",
    "path to fulltext",
    "end of embargo (YYYY-MM-DD)",
    "Institutions",
    "id for SRU (no special characters)"
]


)



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

        if article.get("doi","") in doisToSkip.dois_to_skip:
            #we skip this article
            continue


        article_title=""
        if "article-title" in article:
            article_title="".join(article["article-title"])

        article_subtitle=""
        if "article-subtitle" in article:
            article_subtitle="".join(article["article-subtitle"])


        contrib_affiliations=""
        if "contrib-affiliations" in article:
            if isinstance(article["contrib-affiliations"], list):
                contrib_affiliations=";".join(article["contrib-affiliations"])
            else:
                contrib_affiliations=article["contrib-affiliations"]

        contribs=""
        if "contribs" in article:
            if isinstance(article["contribs"], list):
                contribs=";".join(article["contribs"])
            else:
                contribs=article["contribs"]




        institutionGuess=[]
        addresses=[]
        matchingAuthorAff={}

        if isinstance(article["contrib-aff-role"], list):
            addresses=article["contrib-aff-role"]
        else:
            addresses=[article["contrib-aff-role"]]



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
            getUrl(article.get("doi","")), # "url to download pdf (protected)",
            article_title,   # "Article Title",
            article_subtitle,   # "Article Subtitle",
            contribs.title(),   # "Authors",
            article.get("pyear",""),   # "Year",
            article.get("jtitle",""),   # "Journal Title",
            contrib_affiliations,   # "All Affiliations",
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
            "It was possible to publish this article open access thanks to a Swiss National Licence with the Publisher"   # "Comment"
        ]
        if(institutionGuess):
            for institution in institutionGuess:
                matchingAuthor=matchingAuthorAff[institution].split("/////")[0]
                matchingAffiliation=matchingAuthorAff[institution].split("/////")[1]
                row[0]=matchingAffiliation
                row[1]=matchingAuthor.title()
                row[2]=institution
                files[institution].writerow(row)
            #for all publications, we put all affiliations in the institution column
            row[2]=" ".join(institutionGuess)
            files["known_institution"].writerow(row)
            numberOfPublications["known_institution"]=numberOfPublications["known_institution"]+1
            files["all_publications"].writerow(row)
            numberOfPublications["all_publications"]=numberOfPublications["all_publications"]+1
            rerodoc_file.writerow([
                "(NATIONALLICENCE)"+hit["_id"],
                getPath(article.get("source",""), article.get("path_filename",""), article.get("journal-id","")), # "url to download pdf (protected)",
                getDateEndEmbargo(article.get("source",""),article.get("full-date","")),
                "National Licences: "+ " ".join(institutionGuess),
                idForSru
            ])
        else:
            if(article.get("source","")=="cambridge"):
                #all swiss publications from Cambridge might go in RERO DOC, not only the ones where the institution is recognized as is the case for the other publishers
                rerodoc_file.writerow([
                    "(NATIONALLICENCE)"+hit["_id"],
                    getPath(article.get("source",""), article.get("path_filename",""), article.get("journal-id","")), # "url to download pdf (protected)",
                    getDateEndEmbargo(article.get("source",""),article.get("full-date","")),
                    "", #institutions
                    idForSru
                ])


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
            row[1]=matchingAuthor.title()
            files["unknown_institution"].writerow(row)
            numberOfPublications["unknown_institution"]=numberOfPublications["unknown_institution"]+1
            files["all_publications"].writerow(row)
            numberOfPublications["all_publications"]=numberOfPublications["all_publications"]+1



    #get the next results
    scroll_id=result["_scroll_id"]
    result=es.scroll(scroll_id=scroll_id,scroll="1m")


#Print number of publis per unis

for institution in institutions:
    print institution+" : "+str(numberOfPublications[institution])+" publications"















