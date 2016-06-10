//-------------------------------------
// convert JATS xml data to json for elasticsearch
//-------------------------------------


//input : JATS file (either one file per article or one file per journal)
//output : the articles are indexed in elasticsearch


default out = "stdout";

//indir="/home/lionel/Documents/data-swissbib-no-backup/oxford/";

//indir="/home/lionel/Documents/data-swissbib-no-backup/cambridge/cambridge-xml/";

indir="/home/lionel/Documents/data-swissbib-no-backup/gruyter/";


indir|
read-dir(recursive="true")|
catch-object-exception |
open-file|


decode-xml |
generic-xml-handle-dtd ("article") |
//handle-generic-xml ("article") |
morph(FLUX_DIR + "jatsToElasticSearchMorph.xml")|
change-id("id")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="gruyter-v5", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="1000");
//write-esbulk(baseOutDir="./", fileSize="10000000", jsonCompliant="true");
//write(out);
