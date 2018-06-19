import os
import unicodecsv as csv

files=[]

with open("../swiss-publications-lists-springer/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        path=row[1]
        path='/media/lionel/Data/swissbib-data/nationallizenzen/springer/swiss-pdf/'+path
        id=row[0]
        doi=row[0][26:]
        if not(os.path.isfile(path)):
            print "missing," + doi + ","  + path + "," + id