import urllib2
import re
import time

def get_pdf_url(pii, hdr):
    url_html = "http://www.cambridge.org/core/product/identifier/" + pii + "/type/JOURNAL_ARTICLE"
    request = urllib2.Request(url_html, headers=hdr)

    try:
        response = urllib2.urlopen(request)
    except urllib2.URLError as e:
        if hasattr(e, 'reason'):
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
        elif hasattr(e, 'code'):
            print 'The server couldn\'t fulfill the request.'
            print 'Error code: ', e.code
        return False

    else:
        for line in response:
            url_pdf = re.search(pattern,line)
            if(url_pdf):
                break
        if(url_pdf.group(1)):
            return url_pdf.group(1)
        else:
            return False

def download_and_save_pdf(url, pii, hdr):
    request = urllib2.Request(url, headers=hdr)
    try:
        response = urllib2.urlopen(request)
    except urllib2.URLError as e:
        if hasattr(e, 'reason'):
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
        elif hasattr(e, 'code'):
            print 'The server couldn\'t fulfill the request.'
            print 'Error code: ', e.code
    else:
        file = open("./pdf/" + pii + ".pdf", 'wb')
        file.write(response.read())
        file.close()




hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}

#article identifiers
piis = [
    "S0026749X14000602"
]

url_pdf_regex = '^<meta name="citation_pdf_url" content="(.*pdf)\/'
pattern=re.compile(url_pdf_regex)


for pii in piis:
    pdf_url=get_pdf_url(pii,hdr)
    if(pdf_url):
        download_and_save_pdf(pdf_url, pii,hdr)
    else:
        print "impossible to download pdf for article " + pii
    time.sleep(20) #wait 20 seconds




