import urllib2
import re
import time
import os



oxford_urlkey={
    "asjour" : "asj",
    "afrafj" : "afraf",
    "ahrrev" : "ahr",
    "alecon" : "aler",
    "alhist" : "alh",
    "analys" : "analysis",
    "annbot" : "aob",
    "amtest" : "amt",
    "biosci" : "bioscience",
    "biosts" : "biostatistics",
    "bjaint" : "bja",
    "bjarev" : "bjaed",
    "brainj" : "brain",
    "phisci" : "bjps",
    "aesthj" : "bjaesthetics",
    "crimin" : "bjc",
    "social" : "bjsw",
    "brimed" : "bmb",
    "cameco" : "cje",
    "camquj" : "camqtly",
    "cs" : "cs",
    "cjilaw" : "chinesejil",
    "computer_journal" : "comjnl",
    "conpec" : "cpe",
    "czoolo" : "cz",
    "databa" : "database",
    "litlin" : "dsh",
    "dnares" : "dnaresearch",
    "earlyj" : "em",
    "enghis" : "ehr",
    "entsoc" : "es",
    "eepige" : "eep",
    "humsup" : "eshremonographs",
    "escrit" : "eic",
    "ehjsupp" : "eurheartjsupp",
    "ehjqcc" : "ehjqcco",
    "seujhf" : "eurjhfsupp",
    "ejilaw" : "ejil",
    "eortho" : "ejo",
    "eursoj" : "esr",
    "famprj" : "fampra",
    "foresj" : "forestry",
    "formod" : "fmls",
    "french" : "fh",
    "frestu" : "fs",
    "frebul" : "fsb",
    "gjiarc" : "gsmnras",
    "geront" : "gerontologist",
    "geronj" : "geron",
    "global" : "globalsummitry",
    "hswork" : "hsw",
    "healed" : "her",
    "hiwork" : "hwj",
    "holgen" : "hgs",
    "icsidr" : "icsidreview",
    "imanum" : "imajna",
    "indcor" : "icc",
    "indlaw" : "ilj",
    "innovait" : "rcgp-innovait",
    "ijclaw" : "icon",
    "inttec" : "ijlit",
    "lexico" : "ijl",
    "intpor" : "ijpor",
    "reflaw" : "ijrl",
    "irasia" : "irap",
    "combul" : "itnow",
    "jrlstu" : "jrls",
    "jncmon" : "jncimono",
    "jafeco" : "jae",
    "japres" : "japr",
    "jbchem" : "jb",
    "jconsl" : "jcsl",
    "eccojcc" : "ecco-jcc",
    "eccojs" : "ecco-jccs",
    "cybers" : "cybersecurity",
    "deafed" : "jdsde",
    "design" : "jdh",
    "jnlecg" : "joeg",
    "envlaw" : "jel",
    "exbotj" : "jxb",
    "jfinec" : "jfec",
    "jhuman" : "jhrp",
    "jis" : "jinsectscience",
    "jicjus" : "jicj",
    "jielaw" : "jiel",
    "islamj" : "jis",
    "jlbios" : "jlb",
    "jleorg" : "jleo",
    "jmvmyc" : "jmvm",
    "jmedent" : "jme",
    "jmther" : "jmt",
    "petroj" : "petrology",
    "jporga" : "jpo",
    "jopart" : "jpart",
    "pubmed" : "jpubhealth",
    "refuge" : "jrs",
    "semant" : "jos",
    "semitj" : "jss",
    "jaarel" : "jaar",
    "hiscol" : "jhc",
    "jalsci" : "jhmas",
    "theolj" : "jts",
    "geron" : "biomedgerontology",
    "gerona" : "biomedgerontology",
    "geronb" : "psychsocgerontology",
    "jahist" : "jah",
    "juecol" : "jue",
    "lawprj" : "lpr",
    "lbaeck" : "leobaeck",
    "libraj" : "library",
    "igpl" : "jigpal",
    "mmycol" : "mmy",
    "modjud" : "mj",
    "molbev" : "mbe",
    "mmmcts" : "mmcts",
    "musicj" : "ml",
    "mtspec" : "mts",
    "musict" : "musictherapy",
    "mtpers" : "mtp",
    "musqtl" : "mq",
    "neuonc" : "neuro-oncology",
    "noprac" : "nop",
    "nconsc" : "nc",
    "nictob" : "ntr",
    "notesj" : "nq",
    "narsym" : "nass",
    "ofidis" : "ofid",
    "operaq" : "oq",
    "oxartj" : "oaj",
    "oxjlsj" : "ojls",
    "omcrep" : "omcr",
    "ecopol" : "oxrep",
    "parlij" : "pa",
    "philoq" : "pq",
    "polana" : "pan",
    "pscien" : "ps",
    "ptpsupp" : "ptps",
    "proeng" : "peds",
    "pparep" : "ppar",
    "pasjap" : "pasj",
    "pubjof" : "publius",
    "qjmedj" : "qjmed",
    "qmathj" : "qjmath",
    "qjmamj" : "qjmam",
    "refqtl" : "rsq",
    "regbio" : "rb",
    "revesj" : "res",
    "revfin" : "rfs",
    "brheum" : "rheumatology",
    "sabour" : "sabouraudia",
    "schbul" : "schizophreniabulletin",
    "sochis" : "shm",
    "socpol" : "sp",
    "ssjapj" : "ssjj",
    "sworkj" : "sw",
    "soceco" : "ser",
    "stalaw" : "slr",
    "tlmsoc" : "tlms",
    "tweceb" : "tcbh",
    "vevolu" : "ve",
}

def get_pdf_url(doi, journal_code):
    if oxford_urlkey.has_key(journal_code):
        return "https://academic.oup.com/"+oxford_urlkey[journal_code]+"/article-pdf/doi/"+doi
    else:
        return "https://academic.oup.com/"+journal_code+"/article-pdf/doi/"+doi



def download_and_save_pdf(url, full_name, hdr):
    #download and save the pdf locally in full_name (with directory)
    request = urllib2.Request(url, headers=hdr)
    try:
        response = urllib2.urlopen(request).read()
    except urllib2.URLError as e:
        if hasattr(e, 'reason'):
            print 'Problem with ' + url
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
        elif hasattr(e, 'code'):
            print 'Problem with ' + url
            print 'The server couldn\'t fulfill the request.'
            print 'Error code: ', e.code
    except:
        print 'Problem with ' + url
    else:
        #file = open("pdf/" + pii + ".pdf", 'wb')
        if not os.path.exists(os.path.dirname(full_name)):
            os.mkdir(os.path.dirname(full_name))
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
articles.append({'doi': '10.1093/alcalc/agaa043', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/alacalc/test.pdf'})
articles.append({'doi': '10.1093/aje/152.1.96', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/aje/96.pdf'})
articles.append({'doi': '10.1093/alcalc/agg088', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/alcalc/0380364.pdf'})
articles.append({'doi': '10.1093/alcalc/agg091', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/alcalc/0380369.pdf'})
articles.append({'doi': '10.1093/beheco/13.3.353', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/beheco/0130353.pdf'})
articles.append({'doi': '10.1093/beheco/13.3.359', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/beheco/0130359.pdf'})
articles.append({'doi': '10.1093/beheco/13.3.401', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/beheco/0130401.pdf'})
articles.append({'doi': '10.1093/carcin/21.6.1121', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/carcin/0211121.pdf'})
articles.append({'doi': '10.1093/cercor/13.1.1', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/cercor/0130001.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jju006', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jju006.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jju021', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jju021.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jjv100', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jjv100.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jjv103', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jjv103.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jjv113', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jjv113.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jjv128', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jjv128.pdf'})
articles.append({'doi': '10.1093/ecco-jcc/jjv141', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eccojc/jjv141.pdf'})
articles.append({'doi': '10.1093/ehr/114.456.435-a', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/enghis/1140435a.pdf'})
articles.append({'doi': '10.1053/euhj.2000.2172', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/eurheartj/0.921729.729.pdf'})
articles.append({'doi': '10.1093/geronb/gbv004', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/geronb/gbv004.pdf'})
articles.append({'doi': '10.1093/her/14.2.225', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/healed/0140225.pdf'})
articles.append({'doi': '10.1093/humrep/14.9.2396', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/humrep/0142396.pdf'})
articles.append({'doi': '10.1093/humrep/16.1.96', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/humrep/0160096.pdf'})
articles.append({'doi': '10.1093/humrep/16.1.115', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/humrep/0160115.pdf'})
articles.append({'doi': '10.1093/humrep/16.4.676', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/humrep/0160676.pdf'})
articles.append({'doi': '10.1093/ije/31.2.488', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/ije/0310488.pdf'})
articles.append({'doi': '10.1093/jac/45.1.63', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/jac/0450063.pdf'})
articles.append({'doi': '10.1093/jhered/90.2.323', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/jhered/900323.pdf'})
articles.append({'doi': '10.1093/oxfordjournals.jmicro.a050197', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/jmicro/28-supp-49.pdf'})
articles.append({'doi': '10.1093/nar/28.3.e10', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/nar/gnd010.pdf'})
articles.append({'doi': '10.1093/ndt/18.3.620-a', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/ndt/18620b.pdf'})
articles.append({'doi': '10.1093/petrology/41.1.21', 'path': '/media/lionel/Data/swissbib-data/nationallizenzen/oxford/new-pdf/petroj/EGD002.pdf'})




wait_time=12

for article in articles:
    print article['doi']
    parts=article['path'].split("/")
    journal_code=parts[len(parts)-2]
    pdf_url=get_pdf_url(article['doi'],journal_code)
    print pdf_url
    download_and_save_pdf(pdf_url, article['path'], hdr)
    print "wait "+str(wait_time)+" s"
    time.sleep(wait_time) #wait 20 seconds




