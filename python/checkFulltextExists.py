import os
import unicodecsv as csv

files=[]

with open("../swiss-publications-lists-updates/2020/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        path=row[1]
        path='/media/lionel/Data/swissbib/nationalLicencesData/rerodoc/'+path
        id=row[0]
        doi=row[0][26:]
        if not(os.path.isfile(path)):
            print "missing," + doi + ","  + path + "," + id