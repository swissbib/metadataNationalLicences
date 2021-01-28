import urllib.request
import time
import os
import csv

#python3 script

def download_and_save_pdf(doi, full_name, hdr):
    #download and save the pdf locally in full_name (with directory)
    url="https://link.springer.com/content/pdf/"+doi+".pdf"
    request = urllib.request.Request(url, headers=hdr)
    try:
        response = urllib.request.urlopen(request).read()
    except urllib.request.URLError as e:
        if hasattr(e, 'reason'):
            print('Problem with ' + url)
            print('We failed to reach a server.')
            print('Reason: ', e.reason)
        elif hasattr(e, 'code'):
            print('Problem with ' + url)
            print('The server couldn\'t fulfill the request.')
            print('Error code: ', e.code)
    except:
        print('Problem with ' + url)
    else:
        #file = open("pdf/" + pii + ".pdf", 'wb')
        if not os.path.exists(os.path.dirname(full_name)):
            os.makedirs(os.path.dirname(full_name), exist_ok=True)
        file = open(full_name, 'wb')
        file.write(response)
        file.close()




hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}



articles=[]

wait_time=10

articles=[]
with open("../swiss-publications-lists-updates/2020/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        id = row[0]
        if id.startswith('(NATIONALLICENCE)springer'):
            path=row[1]
            #path='/media/lionel/Data/swissbib-data/nationallizenzen/springer/swiss-pdf/'+path
            id=row[0]
            doi=row[0][26:]
            articles.append({'doi': doi, 'path': path})
            doi=''
            path=''

for article in articles:
    print(article['doi'])
    download_and_save_pdf(article['doi'], article['path'], hdr)
    print("wait "+str(wait_time)+" s")
    time.sleep(wait_time) #wait some time