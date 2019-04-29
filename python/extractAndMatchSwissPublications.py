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
        if matchUZH(address):
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

def matchUZH(affiliation):
    #check if the affiliation is one of UZH affiliations
    # remove accents and umlauts and convert to lower case then do a match

    #emails
    if matchEmail(affiliation, 'uzh.ch'):
        return True
    if matchEmail(affiliation, 'unizh.ch'):
        return True
    if matchEmail(affiliation, 'usz.ch'):
        return True


    #replace special unicode-apostrophe by space (the NFD transformation doesn't transform that)
    affiliation=affiliation.replace(u"’", "'")

    asciiText=unicodedata.normalize('NFD', affiliation).encode('ascii','ignore')

    asciiText=asciiText.lower()




    #negative
    if 'zurich university of applied sciences' in asciiText:
        return False
    if 'sib swiss institute of bioinformatics, CH-1015 lausanne' in asciiText:
        return False



    #positive
    if (
            "addiction research institute, zurich" in asciiText or
            "archaologisches institut der universitat, ramistr" in asciiText or
            "balgrist" in asciiText or
            "cancer registry zurich" in asciiText or
            "ch-8091 zarich" in asciiText or
            "ch-8091 zurich" in asciiText or
            "ch-809l zurich" in asciiText or
            "city hospital triemli" in asciiText or
            "department of neurology, zurich" in asciiText or
            "department of oncology, zurich" in asciiText or
            "departments of medicine and pathology, veterans affairs medical center, san diego, california, denver, colorado, zurich" in asciiText or
            "empirische wirtschaftsforschung der universitat, zurich" in asciiText or
            "essen, hufelandstrasse 55, d-45122 essen, germany, boston, ma, usa, zurich" in asciiText or
            "essen, hufelandstrasse 55, d-45122 essen, germany, zarich" in asciiText or
            "evolutionary biology and environmental studies, 8057 zurich" in asciiText or
            "france, winterthurerstrasse 190, 8057 zurich" in asciiText or
            "funktionelle neurochirugie, ch-8091 zurich, universitatsspital" in asciiText or
            "grosshadern, ludwig-maximilians university, munich, zurich" in asciiText or
            "infectious diseases and hospital epidemiology, zurich" in asciiText or
            "institut far medizinische genetik, zarich" in asciiText or
            "institut fur molekularbiologie der universitat, abteilung ii, winterthurerstrasse" in asciiText or
            "institute for social and preventive medicine, sumatrastr" in asciiText or
            "institute of biomedical engineering, university and federal institute of technology" in asciiText or
            "institute of physiology, zurich" in asciiText or
            "institute of physiology, zurich university" in asciiText or
            "institute of social and preventive medicine of the university" in asciiText or
            "kinderspital, zurich" in asciiText or
            "l'institut de medecine legale de zurich" in asciiText or
            "ludwig-maximilians-university of munich, germany, zurich, switzerland" in asciiText or
            "m27 1ha, uk, zurich, ch-8032 zurich" in asciiText or
            "medical policlinic of the university, kantonsspital, 8006 zurich" in asciiText or
            "medizinische poliklinik, kantonsspital, zurich" in asciiText or
            "medizinische universitatklinik, zurich" in asciiText or
            "medizinische universitatsklinik, kantonsspital, zurich" in asciiText or
            "museum of the history of medicine, zurich" in asciiText or
            "psychiatric hospital zurich" in asciiText or
            "psychiatric university clinic postfach 68, ch 8029 zurich" in asciiText or
            "psychiatrische universitatsklinik, zurich" in asciiText or
            "schmeizberstrasse 12, 8091 zurich" in asciiText or
            "stadtspital triemli, zurich" in asciiText or
            "steinwiesstrasse 75, ch-8032 zurich" in asciiText or
            "swiss school of public health, zurich" in asciiText or
            "triemli city hospital" in asciiText or
            "triemli hospital" in asciiText or
            "uni/eth zurich" in asciiText or
            "universitaet zuerich" in asciiText or
            "universitaetsspital zurich" in asciiText or
            "universitat und der eidgenossischen technischen hochschule zurich" in asciiText or
            "universitat und der eidgenossischen technischen hochschule, zurich" in asciiText or
            "universitat und eth zurich" in asciiText or
            "universitat und eth, ch-8044 zurich" in asciiText or
            "universitat und eth, gloriastr" in asciiText or
            "universitat und eth, zurich" in asciiText or
            "universitat zurich" in asciiText or
            "universitat, winterthurerstrasse" in asciiText or
            "universitatisspital, labor fur onkologie, zurich" in asciiText or
            "universitats spital, zurich" in asciiText or
            "universitats-kinderklinik zurich" in asciiText or
            "universitats-kinderklinik, ch-8032 zurich" in asciiText or
            "universitats-spital zurich" in asciiText or
            "universitatsfrauenklinik zurich" in asciiText or
            "universitatskinderklinik zurich" in asciiText or
            "universitatskinderspital zurich" in asciiText or
            "universitatsklinik zurich" in asciiText or
            "universitatspital zurich" in asciiText or
            "universitatspital, ch-8091 zurich" in asciiText or
            "universitatsspital zurich" in asciiText or
            "universitatsspital, ch-8091 zurich" in asciiText or
            "universitatsspital, ramistr" in asciiText or
            "universitatsspital, zurich" in asciiText or
            "universitatsspitals zurich" in asciiText or
            "universite de zurich" in asciiText or
            "universities of zurich and" in asciiText or
            "universitutsspital, zurich" in asciiText or
            "university & eth zurich" in asciiText or
            "university and cantonal hospitals of zurich" in asciiText or
            "university and e.t.h., zurich" in asciiText or
            "university and eidgenossische technische hochschule (eth) zurich" in asciiText or
            "university and eth zurich" in asciiText or
            "university and eth, zurich" in asciiText or
            "university and swiss federal institute of technology" in asciiText or
            "university ch-8091 zurich" in asciiText or
            "university clinics, kantonsspital, zurich" in asciiText or
            "university heart center" in asciiText or
            "university hospital 8091 zurich" in asciiText or
            "university hospital cha<80><94>8091 zarich" in asciiText or
            "university hospital division of medical oncology, zurich" in asciiText or
            "university hospital in zurich" in asciiText or
            "university hospital of psychiatry zurich, zurich" in asciiText or
            "university hospital of psychiatry, zurich" in asciiText or
            "university hospital of zurich" in asciiText or
            "university hospital ramistr" in asciiText or
            "university hospital regensburg, 93053 regensburg, 93053 regensburg, 8091 zurich" in asciiText or
            "university hospital zarich" in asciiText or
            "university hospital zuerich" in asciiText or
            "university hospital zurich" in asciiText or
            "university hospital, 8091" in asciiText or
            "university hospital, ch-8091" in asciiText or
            "university hospital, department of gynaecology zurich" in asciiText or
            "university hospital, department of obstetric and gynaecology, clinic for endocrinology, 8091 zurich" in asciiText or
            "university hospital, department of obstetrics and gynecology, zurich" in asciiText or
            "university hospital, department of thoracic surgery and division of pulmonology, zurich" in asciiText or
            "university hospital, division of clinical pharmacology, department of medicine, zurich" in asciiText or
            "university hospital, division of nephrology, zurich" in asciiText or
            "university hospital, frauenk" in asciiText or
            "university hospital, raemistr" in asciiText or
            "university hospital, ramistr" in asciiText or
            "university hospital, schmelzbergstr" in asciiText or
            "university hospital, vogelsangstr" in asciiText or
            "university hospital, zurich" in asciiText or
            "university hospitala<80> ramistr" in asciiText or
            "university hospitals basel and zurich" in asciiText or
            "university hospitals of lausanne, zurich, lausanne, switzerland" in asciiText or
            "university hospitals of zurich" in asciiText or
            "university of basel and zurich" in asciiText or
            "university of oxford, oxford, oxford, leiden, zurich" in asciiText or
            "university of zarich" in asciiText or
            "university of zuerich" in asciiText or
            "university of zurich" in asciiText or
            "university rontgeninstitut zurich" in asciiText or
            "university rontgeninstitute zurich" in asciiText or
            "university zurich" in asciiText or
            "university zurich-irchel" in asciiText or
            "university zurich-lrchel" in asciiText or
            "university/eth zurich" in asciiText or
            "universityof zurich" in asciiText or
            "unversity hospital, zurich" in asciiText or
            "vetsuisse faculty zurich" in asciiText or
            "winterthurerstrasse 190, ch-8057 zurich, switzerland" in asciiText or
            "worcester, massachusetts, zurich" in asciiText or
            "writerthurestresse 190, ch-8057, zurich" in asciiText or
            "zoologische museum, universitat, zurich-irchel" in asciiText or
            "zoologisches institut der universitat" in asciiText or
            "zoologisches museum der universitat zarich" in asciiText or
            "zoologisches museum der universitat, zurich" in asciiText or
            "zurich basel plant science center" in asciiText or
            "zurich university" in asciiText or
            "zurich university hospital" in asciiText or
            "zurich university, zurich" in asciiText or
            "zurich-basel plant science center" in asciiText
    ):
        return True

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
        return 'gruyter/'+path
    if(source=="springer"):
        folder=os.path.dirname(path)
        folder=folder.replace("/swissbib/harvesting/nationalLicencesData/springer/extracted/","")
        folder=folder+"/BodyRef/PDF/"
        pdfname=os.path.basename(path)
        pdfname=pdfname.replace(".xml.Meta",".pdf")
        return 'springer/'+folder+pdfname




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
index_to_search="mods"


request = {
    "size": 1000,
    "query": {
        "bool" : {
            "should" : [
                {
                    "bool": {
                        "must": [
                            { "match" : { "source" : "gruyter"}},
                            { "range" : { "pyear" : {"gte" : 2015}}},
                            { "range" : { "pyear" : {"lte" : 2016}}},
                            { "regexp": { "contrib-affiliations": query_term}},
                        ]
                    }
                },
                {
                    "bool": {
                        "must": [
                            {"match": {"source": "springer"}},
                            {"range": {"pyear": {"gte": 2014}}},
                            {"range": {"pyear": {"lte": 2014}}},
                            #for springer we restrict to corresponding authors
                            {"regexp": {"corresp-contrib-affiliations": query_term}},
                        ]
                    }
                }
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
    filename="../swiss-publications-lists-updates/2019/"+institution+".csv"
    files[institution] = csv.writer(open(filename, "wb+"), dialect="excel")

    #csv header
    files[institution].writerow(columns)


rerodoc_file=csv.writer(open("../swiss-publications-lists-updates/2019/rerodoc.csv", "wb+"), dialect="excel")
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

        if article.get("source","")=='springer':
            #we store only the addresses of corresponding authors in addresses
            if "corresp-contrib-aff-role" in article:
                if isinstance(article["corresp-contrib-aff-role"], list):
                    addresses=article["corresp-contrib-aff-role"]
                else:
                    addresses=[article["corresp-contrib-aff-role"]]
        else:
            #we store the addresses of all authors
            if isinstance(article["contrib-aff-role"], list):
                addresses = article["contrib-aff-role"]
            else:
                addresses = [article["contrib-aff-role"]]



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















