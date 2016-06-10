//-------------------------------------
// Count number of articles per issn per year
//-------------------------------------

// The result looks like this
// 0033-4545 | 2013 | (Pure and Applied Chemistry) | 115 articles
// 0033-4545 | 2014 | (Pure and Applied Chemistry) | 174 articles
// 0033-8230 | 1962 | (Radiochimica Acta) | 13 articles
// 0033-8230 | 1963 | (Radiochimica Acta) | 75 articles
// 0033-8230 | 1964 | (Radiochimica Acta) | 83 articles

default out = "issn_years.txt";
indir = "/media/lionel/Data/swissbib-data/degruyter/extracted";


indir|
read-dir(recursive="true")|
filter-strings(".*xml$")|
filter-strings("^((?!issue-files).)*$")| //remove issue-files folders
open-file| 
catch-object-exception |
decode-xml | 
handle-generic-xml ("article") | //"article" is the record delimiter
morph(FLUX_DIR + "countIssnYearsMorph.xml")|
stream-to-triples | 
count-triples(countBy="object") |
template("${s} | ${o} articles") |
write(out); 
