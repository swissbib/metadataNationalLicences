#!/usr/bin/python
# -*- coding: utf-8 -*-

#for these publications, it was impossible to locate the fulltexts and it was not delivered by the publishers
dois_to_skip=[
    # no fulltext available
    "10.1017/S000983880800030X",
    "10.1017/S0009840X00112508",
    "10.1017/S0022336000032820",
    "10.1017/S0022336000033291",
    "10.1017/S0022336000034272",
    "10.1017/S0022336000034363",
    "10.1017/S0022336000037847",
    "10.1017/S0022336000038452",
    "10.1017/S0022336000039627",
    "10.1017/S0022336000039718",
    "10.1017/S002233600003972X",
    "10.1017/S0022336000039858",
    "10.1017/S0022336000042396",
    "10.1017/S0022336000044681",
    "10.1666/0022-3360(2005)079<0356:TLAFGT>2.0.CO;2",
    "10.1666/0022-3360(2004)078<0300:ROTSDA>2.0.CO;2",
    "10.1666/10-013.1",
    "10.1666/10-094.1",
    "10.1666/0022-3360(2007)81[64:POGIPO]2.0.CO;2",
    "10.1666/10-036.1",
    "10.1666/08-143.1",
    "10.1666/09-086.1",
    "10.2307/2586479",
    "10.1017/S0094837300012847",
    "10.1017/S0094837300013063",
    "10.1017/S0094837300013075",
    "10.1017/S0094837300013221",
    "10.1666/0094-8373(2004)030<0082:DADANI>2.0.CO;2",
    "10.1666/0094-8373(2001)027<0104:PARIGT>2.0.CO;2",
    "10.1666/07034.1",
    "10.1086/674396",
    "10.1086/675609",
    "10.1086/675819",
    "10.1086/675825",
    "10.1086/675831",
    "10.1086/506409",
    "10.1086/507293",
    "10.1086/505095",
    "10.1086/502508",
    "10.1086/502512",
    "10.1086/502513",
    "10.1086/502605",
    "10.1086/502606",
    "10.1086/502586",
    "10.1086/502522",
    "10.1086/502537",
    "10.1086/502543",
    "10.1017/S019594170007805X",
    "10.1086/676424",
    "10.1086/591059",
    "10.1086/S0195941700094418",
    "10.1086/S0195941700094844",
    "10.1086/677166",
    "10.1086/677167",
    "10.1086/591062",
    "10.1017/S0195941700095321",
    "10.1017/S0195941700095370",
    "10.1017/S0195941700095412",
    "10.1017/S0308210502000070",
    "10.1017/S0308210502000379",
    "10.1017/S0308210504000447",
    "10.1017/S0308210504000526",
    "10.1017/S1049023X00024006",
    "10.1093/aje/153.1.64",
    "10.1093/aje/152.1.96",
    "10.1093/alcalc/agg088",
    "10.1093/alcalc/agg091",
    "10.1093/beheco/13.3.353",
    "10.1093/beheco/13.3.359",
    "10.1093/beheco/13.3.401",
    "10.1093/carcin/21.6.1121",
    "10.1093/cercor/13.1.1",
    "10.1093/ecco-jcc/jju006",
    "10.1093/ecco-jcc/jju021",
    "10.1093/ecco-jcc/jjv100",
    "10.1093/ecco-jcc/jjv103",
    "10.1093/ecco-jcc/jjv113",
    "10.1093/ecco-jcc/jjv128",
    "10.1093/ecco-jcc/jjv141",
    "10.1093/ehr/114.456.435-a",
    "10.1093/humrep/14.9.2396",
    "10.1093/humrep/16.1.96",
    "10.1093/humrep/16.1.115",
    "10.1093/humrep/16.4.676",
    "10.1093/jac/45.1.63",
    "10.1093/jhered/90.2.323",
    "10.1093/oxfordjournals.jmicro.a050197",
    "10.1093/nar/28.3.e10",
    "10.1093/ndt/18.3.620-a",
    "10.1093/petrology/41.1.21",
    #not in swissbib
    "10.1093/rheumatology/kes109",
    "10.1093/ije/dyu255",
    #duplicate doi's (in alphanumerical)
    "10.1093/intimm/1.1.11",
    "10.1515/JURU.2008.124",
    #doi's merged by CBS
    "10.1093/eurpub/13.suppl_3.107",
    "10.1111/j.1468-2516.2012.00401.x",
    "10.1515/pwp.2003.4.1.141",
    "10.1017/S0007114500002464",
    "10.1017/S0007114500002701",
    "10.1515/mopp-2014-0010",
    "10.1017/S0308210505000545"
]