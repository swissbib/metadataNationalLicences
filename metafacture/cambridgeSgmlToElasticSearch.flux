    //-------------------------------------
// convert "SGML files converted to xml" to json for elasticsearch
//-------------------------------------


default out = "stdout";


//indir="/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/sgml-in-xml-converted/multiple_journals/";

//indir="/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/sgml_converted/FLM/FLM433/";

indir="/home/lionel/Documents/data-swissbib-no-backup/cambridge/cambridge-sgml/";

indir|
read-dir(recursive="true")|

//filter-strings(".*S0022112001003639h.*")|


catch-object-exception |
open-file|
decode-xml |
generic-xml-handle-dtd ("HEADER") |
morph(FLUX_DIR + "cambridgeSgmlToElasticSearchMorph.xml")|
change-id("id")|
catch-stream-exception |
encode-esbulk(escapeChars="true", header="true", index="cambridge-v5", type="article")|
index-esbulk(esNodes="localhost:9300", esClustername="elasticsearch", recordsPerUpload="1000");
//write(out);
