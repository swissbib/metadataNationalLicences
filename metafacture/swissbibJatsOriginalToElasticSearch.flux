//-------------------------------------
// Index Publisher Data directly in ElasticSearch, without a transformation
//-------------------------------------

indir = "/home/lionel/Documents/data-swissbib-no-backup/merged-swissbib-jats/oxford";
default out = "stdout";



indir|
read-dir(recursive="true")|

//filter-strings(".*gruyter-test.*")|

catch-object-exception |
open-file| 
decode-xml | 
handle-generic-xml ("article") | //the record delimiter

//change-id("front.article-meta.custom-meta-group.custom-meta.meta-value.value")|
//change-id("front.article-meta.article-id.value")|
change-id("front.article-meta.custom-meta-group.custom-meta.meta-value.value")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="oxford-original", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="10000");
//write(out);