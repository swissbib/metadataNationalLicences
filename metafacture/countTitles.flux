//-------------------------------------
// Count number of articles per journal titles
//-------------------------------------

// result looks like this (markdown table)
// |   144|European Tort Law Yearbook|
//   |   146|New Global Studies|
//   |   147|Umsatzsteuer-Rundschau|

default file = "/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/de_gruyter/sagmb/sagmb.2015.14.issue-4/sagmb-2014-0078/sagmb-2014-0078.xml";
default out = "stdout";

file| 
open-file| 
decode-xml | 
handle-generic-xml ("article") | //"article" is the record delimiter
morph(FLUX_DIR + "countTitlesMorph.xml")|
stream-to-triples | 
count-triples(countBy="object") |
write(out); 
