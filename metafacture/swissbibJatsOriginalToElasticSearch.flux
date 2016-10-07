//-------------------------------------
// Index Publisher Data directly in ElasticSearch, without a transformation
//-------------------------------------

indir = "/home/lionel/Documents/data-swissbib-no-backup/merged-swissbib-jats/gruyter";



indir|
read-dir(recursive="true")|
catch-object-exception |
open-file| 
decode-xml | 
handle-generic-xml ("article") | //the record delimiter

//change-id("front.article-meta.custom-meta-group.custom-meta.meta-value.value")|
change-id("front.article-meta.article-id.value")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="gruyter-original", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="10000");
