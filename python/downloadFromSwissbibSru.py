#!/usr/bin/python
# -*- coding: utf-8 -*-

import urllib2
import unicodecsv as csv

def download_and_save_marc_xml(id):
    #download and save the xml marc record locally using the name id.xml

    sruBegin="http://sru.swissbib.ch/sru/search/defaultdb?query=+dc.anywhere+exact+NATIONALLICENCE"
    sruMiddle="&operation=searchRetrieve&recordSchema=info%3Asrw%2Fschema%2F"
    sruEnd="&maximumRecords=10&startRecord=0&recordPacking=XML&availableDBs=defaultdb&sortKeys=Submit+query"

    url = sruBegin+id+sruMiddle+"1%2Fmarcxml-v1.1-light"+sruEnd
    request = urllib2.Request(url)
    try:
        response = urllib2.urlopen(request).read()
    except urllib2.URLError as e:
        if hasattr(e, 'reason'):
            print 'Problem with ' + id
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
        elif hasattr(e, 'code'):
            print 'Problem with ' + id
            print 'The server couldn\'t fulfill the request.'
            print 'Error code: ', e.code
    else:
        file = open("/media/lionel/Data/swissbib/nationalLicencesData/rerodoc/marcxml-swissbib" + id + ".xml", 'w')
        file.write(response)
        file.close()




hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}

#article identifiers, we will download all these pdf's

ids = []

with open("../swiss-publications-lists-updates/2020/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        id = row[0]
        id_sru = row[4]
        ids.append(id_sru)
        id_sru =''


for id in ids:
    print id
    download_and_save_marc_xml(id)





