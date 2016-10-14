#!/usr/bin/python
# -*- coding: utf-8 -*-


from pymarc import MARCReader
import re
import unicodecsv as csv

file = csv.writer(open("file.csv", "wb+"), dialect="excel")

file.writerow(["journal code", "language(marc)", "title", "url"])


with open('/home/lionel/Documents/mycloud/swissbib/publishers/gruyter/JAPCL14_20151007.mrc', 'rb') as fh:
    reader = MARCReader(fh)
    for record in reader:
        #print(record['008'].value()[35:38])
        #print(record['245']['a'])
        #if(record['024']['a']):
        #    print(record['024']['a'])
        #print(record['856']['u'])
        #faire regexp pour trouver le code
        url=record['856']['u']
        code=re.search('\/([a-z]*)$', url)
        if(not(code)):
            code=re.search('j\/([a-z]*)?', url)
        if(code):
            code=code.group(1)
        else:
            code=""
        file.writerow([code, record['008'].value()[35:38], record['245']['a'], url ])




    #continuer ici faire un export csv du marc



