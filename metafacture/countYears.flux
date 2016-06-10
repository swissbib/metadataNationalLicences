//-------------------------------------
// Count number of articles per year (with the type of the year, print year, electronic year, ...)
//-------------------------------------


// result looks like this (markdown table)
// |epub|2012|16272 articles
// |epub|2013|27473 articles
// |epub|2014|24681 articles
// |epub|2015|20094 articles
// |ppub|2011|11028 articles
// |ppub|2012|12906 articles
// |ppub|2013|13195 articles
// |ppub|2014|14754 articles


default out = "result.txt";
//indir = "/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/de_gruyter";
indir = "/media/lionel/Data/swissbib-data/degruyter/extracted";

indir|
read-dir(recursive="true")|
filter-strings(".*xml$")|
filter-strings("^((?!issue-files).)*$")| //remove issue-files folders
open-file| 
catch-object-exception |
decode-xml | 
handle-generic-xml ("article") | //"article" is the record delimiter
morph(FLUX_DIR + "countYearsMorph.xml")|
stream-to-triples | 
count-triples(countBy="object") |
write(out); 
