#!/usr/bin/python
# -*- coding: utf-8 -*-

# checks the percentage of presence of various fields in elasticsearch
# outputs in a markdown table


import unicodecsv as csv
import datetime
import json
from elasticsearch import Elasticsearch
import re

import locale
locale.setlocale(locale.LC_ALL, '')

es = Elasticsearch()

targetDirectory = "/home/lionel/Documents/mycloud/swissbib/git_repo/documentation/_includes/quality_control/"


#field statistics
request1 = "affiliations,author,article-title,copyright-year,eissn,eyear,emails,journal-id,journal-title,license-link,license-paragraph,license-type,pissn,pyear,contributor,keywords,abstract"


for publisher in ["gruyter", "oxford", "cambridge"]:
#for publisher in ["gruyter"]:

    index_to_query=publisher

    result1 = es.field_stats(index=index_to_query, fields=request1)


    # --- Fields presence ---
    filename_fields=targetDirectory+publisher+"1/fieldsES.txt"
    title_list = csv.writer(open(filename_fields, "wb+"), delimiter="|")
    for x in sorted(result1["indices"]["_all"]["fields"]):
        title_list.writerow([x, str(result1["indices"]["_all"]["fields"][x]["density"]) + "%", "{0:n}".format(result1["indices"]["_all"]["fields"][x]["doc_count"])])










