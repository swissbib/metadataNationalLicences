import os
import unicodecsv as csv

files=[]

with open("../swiss-publications-lists/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        path=row[1]
        if not(os.path.isfile(path)):
            print "missing " + path