import os
import unicodecsv as csv

files=[]

with open("../swiss-publications-lists-updates/2019/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        path=row[1]
        path='/media/lionel/Data/swissbib-data/nationallizenzen/rerodoc/fulltexts/'+path
        id=row[0]
        doi=row[0][26:]
        if not(os.path.isfile(path)):
            print "missing," + doi + ","  + path + "," + id