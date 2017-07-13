import urllib2
import re
import time

def get_pdf_url(pii, hdr):
    # return the url to the pdf by parsing the html of the landing page
    # return False if unsuccessful
    url_html = "http://www.cambridge.org/core/product/identifier/" + pii + "/type/JOURNAL_ARTICLE"
    request = urllib2.Request(url_html, headers=hdr)

    try:
        response = urllib2.urlopen(request)
    except urllib2.URLError as e:
        if hasattr(e, 'reason'):
            print 'Problem with ' + pii
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
        elif hasattr(e, 'code'):
            print 'Problem with ' + pii
            print 'The server couldn\'t fulfill the request.'
            print 'Error code: ', e.code
        return False

    else:
        try:
            for line in response:
                url_pdf = re.search(pattern,line)
                if(url_pdf):
                    break
            if(url_pdf.group(1)):
                return url_pdf.group(1)
            else:
                return False
        except:
            print 'Problem with ' + pii
            print 'Impossible to parse html.'


def download_and_save_pdf(url, pii, hdr):
    #download and save the pdf locally using the name pii.pdf
    request = urllib2.Request(url, headers=hdr)
    try:
        response = urllib2.urlopen(request).read()
    except urllib2.URLError as e:
        if hasattr(e, 'reason'):
            print 'Problem with ' + pii
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
        elif hasattr(e, 'code'):
            print 'Problem with ' + pii
            print 'The server couldn\'t fulfill the request.'
            print 'Error code: ', e.code
    except:
        print 'Problem with ' + pii
    else:
        file = open("/media/lionel/Data/swissbib-data/nationallizenzen/cambridge/new-pdf/" + pii + ".pdf", 'wb')
        #file = open("/swissbib/harvesting/nationalLicencesData/cambridge/pdf-2nd-part/" + pii + ".pdf", 'wb')
        file.write(response)
        file.close()




hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}

#article identifiers, we will download all these pdf's
piis_prod = [
    "S000711450778697X",
    "S0007114507832971",
    "S0007114508965314",
    "S0007114512001808",
    "S0007114515002147",
    "S0007485314000741",
    "S0008423900020904",
    "S000983880800030X",
    "S0009840X00112508",
    "S0020589300000075",
    "S0021932000024329",
    "S0022029900027187",
    "S0022336000020151",
    "S0022336000025373",
    "S0022336000026585",
    "S0022336000030407",
    "S0022336000032820",
    "S0022336000033291",
    "S0022336000034272",
    "S0022336000034363",
    "S0022336000037847",
    "S0022336000038452",
    "S0022336000039627",
    "S0022336000039718",
    "S002233600003972X",
    "S0022336000039858",
    "S0022336000042396",
    "S0022336000044681",
    "S0022336000045212",
    "S0022336000046448",
    "S0022336000047338",
    "S0022336000047582",
    "S0022336000050575",
    "S0022336000051180",
    "S0022336000052227",
    "S0022336000053051",
    "S0022481200004667",
    "S0022481200013414",
    "S0025727300043076",
    "S0033291700011880",
    "S0094837300012847",
    "S0094837300013063",
    "S0094837300013075",
    "S0094837300013221",
    "S0094837300018388",
    "S0094837300021692",
    "S0094837300023927",
    "S019594170003469X",
    "S0195941700035529",
    "S0195941700035736",
    "S0195941700035815",
    "S0195941700035906",
    "S0195941700045409",
    "S0195941700045537",
    "S019594170005150X",
    "S0195941700051900",
    "S0195941700051948",
    "S019594170005195X",
    "S019594170007421X",
    "S0195941700074221",
    "S0195941700076542",
    "S0195941700077791",
    "S0195941700077985",
    "S0195941700078048",
    "S019594170007805X",
    "S0195941700093322",
    "S0195941700093528",
    "S0195941700094418",
    "S0195941700094844",
    "S0195941700094960",
    "S0195941700095060",
    "S0195941700095321",
    "S0195941700095321",
    "S0195941700095370",
    "S0195941700095412",
    "S0308210500031115",
    "S0308210502000070",
    "S0308210502000379",
    "S0308210504000447",
    "S0308210504000526",
    "S0376892900016933",
    "S0515036100011144",
    "S0884291400031988",
    "S1049023X0000306X",
    "S1049023X00024006",
    "S1355770X11000155",
    "S1472669600000943",
    "S1479262111000839",
    "S1742758400012583",
    "S2045796011000254"
]


piis=piis_prod

url_pdf_regex = '^<meta name="citation_pdf_url" content="(.*pdf)\/'
pattern=re.compile(url_pdf_regex)

wait_time=12

for pii in piis:
    print pii
    pdf_url=get_pdf_url(pii,hdr)
    if(pdf_url):
        download_and_save_pdf(pdf_url, pii,hdr)
    else:
        print "impossible to download pdf for article " + pii

    print "wait "+str(wait_time)+" s"
    time.sleep(wait_time) #wait 20 seconds




