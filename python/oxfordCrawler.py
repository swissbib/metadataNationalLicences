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
articles.append({'doi': '10.1093/alcalc/agaa043', 'path': '/media/lionel/Data/swissbib/nationalLicencesData/pdfs2021/oxford/test.pdf'})




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




