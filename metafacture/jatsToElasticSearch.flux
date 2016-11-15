//-------------------------------------
// convert JATS xml data to json for elasticsearch
//-------------------------------------


//input : JATS file (either one file per article or one file per journal)
//output : the articles are indexed in elasticsearch


default out = "stdout";

//indir="/home/lionel/Documents/data-swissbib-no-backup/oxford1/";

//indir=".";

indir="/home/lionel/Documents/data-swissbib-no-backup/merged-swissbib-jats";

//indir="/home/lionel/Documents/data-swissbib-no-backup/gruyter/";

//indir="/home/lionel/Documents/data-swissbib-no-backup/oxford2/";


indir|
read-dir(recursive="true")|

//filter-strings(".*oxford-imaiai*")|


catch-object-exception |
open-file|


decode-xml |
generic-xml-handle-dtd ("article") |
//handle-generic-xml ("article") |
morph(FLUX_DIR + "jatsToElasticSearchMorph.xml")|
change-id("id")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="all-sb-jats-v1", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="10000");
//write(out);
