//-------------------------------------
// Index De Gruyter Data directly in ElasticSearch, without a transformation
//-------------------------------------

default out = "gruyter.json";
indir = "/home/lionel/Documents/data-swissbib-no-backup/de_gruyter_test/";



indir|
read-dir(recursive="true")|
catch-object-exception |
open-file| 
decode-xml | 
handle-generic-xml ("article") | //the record delimiter
change-id("front.article-meta.article-id.value")|
//change-id("front.article-meta.title-group.article-title.value")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="gruyter", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="10000");
