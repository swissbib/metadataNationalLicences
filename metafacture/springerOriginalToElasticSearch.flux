//-------------------------------------
// convert springer data to elastic search directly, without any transformation
//-------------------------------------


default out = "springer.json";
indir = "//media/lionel/Data/swissbib-data/nationallizenzen/merged-original/springer/3rd_attempt_without_problem/";


indir|
read-dir(recursive="true")|
catch-object-exception |
open-file| 
decode-xml |
generic-xml-handle-dtd ("Publisher") | //"Publisher" is the record delimiter
//handle-generic-xml ("Publisher") |
change-id("Journal.Volume.Issue.Article.ArticleInfo.ArticleDOI.value")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="springer-original-v1", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="10000");

//encode-json (prettyprinting="true")|
//write(out);
