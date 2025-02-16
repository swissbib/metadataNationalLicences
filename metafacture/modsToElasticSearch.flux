//-------------------------------------
// convert MODS xml data to json for elasticsearch
//-------------------------------------


//input : MODS file (either one file per article or one file per journal)
//output : the articles are indexed in elasticsearch


default out = "stdout";

//indir="/home/lionel/Documents/data-swissbib-no-backup/oxford1/";

//indir=".";

//indir="/home/lionel/Documents/data-swissbib-no-backup/merged-swissbib-jats";

//indir="/home/lionel/Documents/data-swissbib-no-backup/gruyter/";

//indir="/home/lionel/Documents/data-swissbib-no-backup/oxford2/";

//indir="/media/lionel/Data/swissbib-data/nationallizenzen/mods/springer/";
indir="/media/lionel/Data/swissbib/nationalLicencesData/mods2021/";
//indir="/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/data-samples/swissbib/";


indir|
read-dir(recursive="true")|

filter-strings(".*xml.*")|


catch-object-exception |
open-file|


decode-xml |
generic-xml-handle-dtd ("mods") |
//handle-generic-xml ("article") |
morph(FLUX_DIR + "modsToElasticSearchMorph.xml")|
change-id("id")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="mods", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="10000");
//write(out);
