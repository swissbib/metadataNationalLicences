#!/usr/bin/python
# -*- coding: utf-8 -*-

import unicodecsv as csv
import datetime
import json
from elasticsearch import Elasticsearch
import re


import locale
locale.setlocale(locale.LC_ALL, '')



import metadataCorrections
#all the metadata corrections, missing journals..



# This script generates 3 title lists based on the article metadata in Elasticsearch
# - a KBART title list
# - a csv title list
# - a csv title list with more fields to analyze the coverage of the metadata

es = Elasticsearch()
targetDirectoryCSV = "../title-lists/"






# elasticsearch request
request = {
    "query" : {
        "bool": {
            "must" : {"range" : { "pyear" : {"lte" : 2015}}},
            "must_not" : {"match" : { "article-title" : "frontmatter"}},
            "must_not" : {"match" : { "article-title" : "titelei"}}
        }
    },
    "aggs": {
        "journal_agg": {
            "terms": {
                "field": "journal-id",
                "size" : 10000,
                "order" : {
                    "_term" : "asc"
                }
            },
            "aggs": {
                "title_agg": {
                    "terms": {
                        "field": "journal-title",
                        "size": 1
                    }
                },
                "eissn_agg": {
                    "terms": {
                        "field": "eissn",
                        ""
                        "size": 1
                    }
                },
                "pissn_agg": {
                    "terms": {
                        "field": "pissn",
                        "size": 1
                    }
                },
                "publisher_name_agg": {
                    "terms": {
                        "field": "publisher-name",
                        "size": 1
                    }
                },
                "min_year" : {"min" : { "field" : "pyear"}},
                "max_year" : {"max" : { "field" : "pyear"}},
                "min_volume" : {"min" : { "field" : "volume-number"}},
                "max_volume" : {"max" : { "field" : "volume-number"}},

                "number_of_years" : {"cardinality" : { "field" : "pyear"}},
                "number_of_volumes" : {"cardinality" : { "field" : "volume-number"}}

            }
        }
    }
}










# to be able to construct journal url's

baseJournalUrl = {
    "gruyter":"http://www.degruyter.com/view/j/",
    "cambridge":"http://www.cambridge.org/core/product/identifier/",
    "oxford":"https://academic.oup.com/",
    "oxford2":"http://",
    "springer":"http://link.springer.com/journal/"
}

postJournalUrl= {
    "gruyter":"",
    "cambridge":"/type/JOURNAL",
    "oxford":"",
    "oxford2":" ",
    "springer":""
}






#for publisher in ["gruyter", "oxford", "cambridge","oxford2"]:
for publisher in ["oxford"]:

    index_to_query=publisher

    result = es.search(search_type="count", body=request, index=index_to_query, doc_type="article")

    
    topresult={} #to store the most common value of a field
    ratio={} #to store the proportion of articles which have the most common value on the total number of articles which have any value for this field
    date=datetime.datetime.strftime(datetime.datetime.now(),'%Y-%m-%d')


    #--- Extended Title List for analysis ---
    filename_title_list=targetDirectoryCSV+publisher+"_analysis.csv"
    title_list = csv.writer(open(filename_title_list, "wb+"), dialect="excel")
    #csv header
    title_list.writerow([
        "journal_id",
        "title",
        "% of articles with this title",
        "eissn",
        "%of articles with this eissn",
        "pissn",
        "%of articles with this pissn",
        "publisher",
        "%of articles with this publisher",
        "url",
        "number of articles",
        "minYear",
        "maxYear",
        "cardinality",
        "missing years",
        "min_volume",
        "max_volume",
        "cardinality-volumes",
        "number of missing volumes"])


    #--- Public Title List ---
    filename_public_title_list=targetDirectoryCSV+publisher+"_title_list_"+date+".csv"
    public_title_list = csv.writer(open(filename_public_title_list, "wb+"), dialect="excel")

    #csv header
    public_title_list.writerow([
        "Publisher Code",
        "Journal Title",
        "Print ISSN",
        "Electronic ISSN",
        "Publisher",
        "Url",
        "Total Number of articles",
        "First Year in the Licence",
        "First Volume in the Licence",
        "Last Year in the Licence",
        "Last Volume in the Licence"
    ])




    #--- KBART file ---
    filename_kbart=targetDirectoryCSV+publisher+"_Switzerland_NationalLicences_"+date+".txt"
    kbart_list = csv.writer(open(filename_kbart, "wb+"), delimiter="\t")

    #csv header
    kbart_list.writerow(["publication_title",
                         "print_identifier",
                         "online_identifier",
                         "date_first_issue_online",
                         "num_first_vol_online",
                         "num_first_issue_online",
                         "date_last_issue_online",
                         "num_last_vol_online",
                         "num_last_issue_online",
                         "title_url",
                         "first_author",
                         "title_id",
                         "embargo_info",
                         "coverage_depth",
                         "notes",
                         "publisher_name",
                         "publication_type",
                         "date_monograph_published_print",
                         "date_monograph_published_online",
                         "monograph_volume",
                         "monograph_edition",
                         "first_editor",
                         "parent_publication_title_id",
                         "preceding_publication_title_id",
                         "access_type"
                         ])

    #write rows for all files





    for x in result["aggregations"]["journal_agg"]["buckets"]:


        if publisher == "cambridge" and x["key"]== "tia":
            #this journal has a problem, we skip it
            continue
        if publisher == "gruyter" and (x["key"] in metadataCorrections.gruyter_journals_to_skip):
            #these journals shouldn't be included, we skip them
            continue
        if publisher == "springer" and (x["key"] not in metadataCorrections.springer_included_journals):
            #we skip springer journals which are not part of the contract
            continue
        if publisher == "oxford" and x["key"][0:4]== "6.3.":
            #these journals have a problem, we skip them
            continue


        for agg in ["title_agg", "pissn_agg", "eissn_agg", "publisher_name_agg"]:
            topresult[agg]=""
            ratio[agg]=float('NaN')
            if len(x[agg]["buckets"])>0:
                topresult[agg]=x[agg]["buckets"][0]["key"]
                if (x[agg]["buckets"][0]["doc_count"]+x[agg]["sum_other_doc_count"])!=0:
                    #ratio["pissn_agg"] is the percentage of documents that have the most common issn with respect to the total number of documents which have a pissn
                    ratio[agg]=100.0*x[agg]["buckets"][0]["doc_count"]/(x[agg]["buckets"][0]["doc_count"]+x[agg]["sum_other_doc_count"])
                else:
                    ratio[agg]=0.0

        if publisher == "oxford":
            #too many mistakes in Oxford metadata
            publisher_name="Oxford University Press"
        else:
            publisher_name=topresult["publisher_name_agg"]



        if topresult["pissn_agg"]==topresult["eissn_agg"]:
            topresult["eissn_agg"]=""

        #we only trust min-volume and max-volume if none of these numbers are years
        #the problem is that sometimes in the metadata, the years are used in volumes, and volumes and issues are mixed up

        if x["min_volume"]["value"]>=1700 or x["max_volume"]["value"]>=1700:
            min_volume=""
            max_volume=""
        else:
            min_volume=int(x["min_volume"]["value"])
            max_volume=int(x["max_volume"]["value"])


        min_year=int(x["min_year"]["value"])
        max_year=int(x["max_year"]["value"])




        ## This is meant to correct some of Cambridge errors
        if publisher== "cambridge":
            if metadataCorrections.cambridge_correct_start_year.has_key(x["key"]):
                min_year=metadataCorrections.cambridge_correct_start_year[x["key"]]
            if metadataCorrections.cambridge_correct_end_year.has_key(x["key"]):
                max_year=metadataCorrections.cambridge_correct_end_year[x["key"]]
            if metadataCorrections.cambridge_correct_start_volume.has_key(x["key"]):
                min_volume=metadataCorrections.cambridge_correct_start_volume[x["key"]]
            if metadataCorrections.cambridge_correct_end_volume.has_key(x["key"]):
                max_volume=metadataCorrections.cambridge_correct_end_volume[x["key"]]

        ## This is meant to correct some of gruyter errors
        if publisher== "gruyter":
            if metadataCorrections.gruyter_correct_start_year.has_key(x["key"]):
                min_year=metadataCorrections.gruyter_correct_start_year[x["key"]]
            if metadataCorrections.gruyter_correct_start_volume.has_key(x["key"]):
                min_volume=metadataCorrections.gruyter_correct_start_volume[x["key"]]
            if metadataCorrections.gruyter_correct_end_year.has_key(x["key"]):
                max_year=metadataCorrections.gruyter_correct_end_year[x["key"]]
            if metadataCorrections.gruyter_correct_end_volume.has_key(x["key"]):
                max_volume=metadataCorrections.gruyter_correct_end_volume[x["key"]]

        keyforurl=x["key"]

        #for De Gruyter, url with keys such as text.1 or bchm2 don't work
        if publisher== "gruyter" and re.search("\d$", keyforurl):
            #this will replace text.1 by text and bchm2 by bchm
            keyforurl=keyforurl[0:keyforurl.find(".")]

        if publisher== "gruyter" and keyforurl=="flih":
            keyforurl="flin"

        if publisher== "gruyter" and keyforurl=="mdr":
            keyforurl="mfir"

        #corrections for Oxford
        if (publisher == "oxford" or publisher=="oxford2") and metadataCorrections.oxford_urlkey.has_key(keyforurl):
            #replace journal code by url code
            keyforurl=metadataCorrections.oxford_urlkey[keyforurl]

        ## This is meant to correct oxford missing content as of 20.5.2016
        if publisher== "oxford":
            if metadataCorrections.oxford_correct_start_year.has_key(topresult["pissn_agg"]):
                min_year=metadataCorrections.oxford_correct_start_year[topresult["pissn_agg"]]
            if metadataCorrections.oxford_correct_start_year.has_key(topresult["eissn_agg"]):
                min_year=metadataCorrections.oxford_correct_start_year[topresult["eissn_agg"]]
            if metadataCorrections.oxford_correct_start_volume.has_key(topresult["pissn_agg"]):
                min_volume=metadataCorrections.oxford_correct_start_volume[topresult["pissn_agg"]]
            if metadataCorrections.oxford_correct_start_volume.has_key(topresult["eissn_agg"]):
                min_volume=metadataCorrections.oxford_correct_start_volume[topresult["eissn_agg"]]

        number_of_articles=x["doc_count"]


        title_list.writerow([x["key"],
                             topresult["title_agg"],
                             '{0:.1f}'.format(ratio["title_agg"]),
                             topresult["eissn_agg"],
                             '{0:.1f}'.format(ratio["eissn_agg"]),
                             topresult["pissn_agg"],
                             '{0:.1f}'.format(ratio["pissn_agg"]),
                             publisher_name,
                             '{0:.1f}'.format(ratio["publisher_name_agg"]),
                             baseJournalUrl[publisher]+keyforurl+postJournalUrl[publisher], #"Url"
                             number_of_articles,
                             min_year,
                             max_year,
                             x["number_of_years"]["value"],
                             int(x["max_year"]["value"] or 0) - int(x["min_year"]["value"] or 0) + 1 - int(x["number_of_years"]["value"] or 0),
                             min_volume,
                             max_volume,
                             x["number_of_volumes"]["value"],
                             int(max_volume or 0) - int(min_volume or 0) + 1 - int(x["number_of_volumes"]["value"] or 0)
                             ])


        public_title_list.writerow([
            x["key"], #"Publisher Code"
            topresult["title_agg"], #"Journal Title"
            topresult["pissn_agg"], #"Print ISSN"
            topresult["eissn_agg"], #"Electronic ISSN"
            publisher_name, #"Publisher"
            baseJournalUrl[publisher]+keyforurl+postJournalUrl[publisher], #"Url"
            number_of_articles, #"Total Number of articles"
            min_year, #"First Year in the Licence"
            min_volume, #"First Volume in the Licence"
            max_year, #"Last Year in the Licence"
            max_volume, #"Last Volume in the Licence"
        ])


        kbart_list.writerow([
                    topresult["title_agg"],  #publication_title
                    topresult["pissn_agg"],  #print_identifier
                    topresult["eissn_agg"],  #online_identifier
                    min_year,  #date_first_issue_online
                    min_volume,  #num_first_vol_online
                    "",  #num_first_issue_online
                    max_year,  #date_last_issue_online,
                    max_volume,  #num_last_vol_online
                    "",  #num_last_issue_online
                    baseJournalUrl[publisher]+keyforurl+postJournalUrl[publisher],  #title_url
                    "",  #first_author
                    x["key"],  #title_id
                    "",  #embargo_info
                    "fulltext",  #coverage_depth
                    "",  #notes
                    publisher_name,  #"publisher_name",
                    "serial",  #"publication_type",
                    "",  #"date_monograph_published_print",
                    "",  #"date_monograph_published_online",
                    "",  #"monograph_volume",
                    "",  #"monograph_edition",
                    "",  #"first_editor",
                    "",  #"parent_publication_title_id
                    "",  #preceding_publication_title_id",
                    ""  #"access_type"
                    ])

    if publisher== "oxford":
        #Add the missing journals
        for journal in metadataCorrections.oxford_missing_journals:

            #compute journal url
            keyforurl=journal["title_id"]
            #corrections for Oxford
            if publisher== "oxford" and metadataCorrections.oxford_urlkey.has_key(keyforurl):
            #replace journal code by url code
                keyforurl=metadataCorrections.oxford_urlkey[keyforurl]



            public_title_list.writerow([
                journal["title_id"], #"Publisher Code"
                journal["title"], #"Journal Title"
                journal["pissn"], #"Print ISSN"
                journal["eissn"], #"Electronic ISSN"
                journal["publisher"], #"Publisher"
                baseJournalUrl[publisher]+keyforurl+postJournalUrl[publisher], #"Url"
                "", #"Total Number of articles"
                journal["min_year"], #"First Year in the Licence"
                journal["min_volume"], #"First Volume in the Licence"
                journal["max_year"], #"Last Year in the Licence"
                journal["max_volume"], #"Last Volume in the Licence"
            ])

            kbart_list.writerow([
                journal["title"],  #publication_title
                journal["pissn"],  #print_identifier
                journal["eissn"],  #online_identifier
                journal["min_year"],  #date_first_issue_online
                journal["min_volume"],  #num_first_vol_online
                "",  #num_first_issue_online
                journal["max_year"],  #date_last_issue_online,
                journal["max_volume"],  #num_last_vol_online
                "",  #num_last_issue_online
                baseJournalUrl[publisher]+keyforurl+postJournalUrl[publisher],  #title_url
                "",  #first_author
                journal["title_id"],  #title_id
                "",  #embargo_info
                "fulltext",  #coverage_depth
                "",  #notes
                journal["publisher"],  #"publisher_name",
                "serial",  #"publication_type",
                "",  #"date_monograph_published_print",
                "",  #"date_monograph_published_online",
                "",  #"monograph_volume",
                "",  #"monograph_edition",
                "",  #"first_editor",
                "",  #"parent_publication_title_id
                "",  #preceding_publication_title_id",
                ""  #"access_type"
            ])








