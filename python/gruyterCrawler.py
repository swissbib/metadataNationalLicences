import urllib.request
import time
import os
import csv

#python3 script

def download_and_save_pdf(path, hdr):
    #download and save the pdf locally in full_name (with directory)


    url="https://www.degruyter.com/downloadpdf/" + path
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
        path='gruyter/'+path
        if not os.path.exists(os.path.dirname(path)):
            os.makedirs(os.path.dirname(path), exist_ok=True)
        file = open(path, 'wb')
        file.write(response)
        file.close()




hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}



articles=[]
with open("../swiss-publications-lists-updates/2020/rerodoc.csv") as csvfile:
    publications = csv.reader(csvfile, dialect='excel')
    for row in publications:
        id = row[0]
        if id.startswith('(NATIONALLICENCE)gruyter'):
            path=row[1]
            #path='/media/lionel/Data/swissbib-data/nationallizenzen/springer/swiss-pdf/'+path
            id=row[0]
            doi=row[0][26:]
            articles.append({'path': path.replace('gruyter/','')})
            doi=''
            path=''

wait_time=10

for article in articles:
    print(article['path'])
    download_and_save_pdf(article['path'], hdr)
    print("wait "+str(wait_time)+" s")
    time.sleep(wait_time) #wait some time