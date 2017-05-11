#!/bin/bash
#extract oxford tar files in one directory per journal with subfolder per issues (standard would be one directory per issue)

#Input
#    source
#    ├── ACN
#    │   ├── acn12-1.tar (one issue per archive)
#    │   ├── acn12-2.tar
#    │   ├── ...
#    ├── CARDIOVASRES
#    │   ├── cardiovascres31-1.tar
#    │   ├── cardiovascres31-2.tar
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
	tar -xf "$filename" -C "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
done;
}


cd $SOURCE_DIRECTORY
find . -name "*.tar" | extract







