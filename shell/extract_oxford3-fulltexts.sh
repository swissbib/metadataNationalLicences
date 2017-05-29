#!/bin/bash
#extract oxford tar files in one directory per journal with subfolder per issues (standard would be one directory per issue)

#Input
#    source
#    ├── Archives of Clinical Neuropsychology
#    │   ├── acn_10_1.pdf.zip (one issue per archive with all the pdf)
#    │   ├── acn_10_2.pdf.zip
#    │   ├── ...
#    ├── Cardiovascular Research
#    │   ├── cardiovascres_31_1.pdf.zip
#    │   ├── cardiovascres_31_2.pdf.zip
#    │   ├── ...



if [ $# -ne 2 ]
then
   echo "Usage: $0 SOURCE_DIRECTORY TARGET_DIRECTORY"
   exit 1
else
   SOURCE_DIRECTORY=$1
   TARGET_DIRECTORY=$2
fi



function extract ()
{   
while read filename; do 
	#only get parent directory (which is journal name)
	PARENT_DIRECTORY="$(basename "$(dirname "$filename")")"
	mkdir -p "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
	unzip -oq "$filename" -d "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
done;
}


cd $SOURCE_DIRECTORY
find . -name "*.zip" | extract







