#!/bin/bash
#extract oxford tar files in one directory per journal with subfolder per issues (standard would be one directory per issue)

#test
#SOURCE_DIRECTORY=/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/oxford2/

SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_sending/
TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_extracted/



function extract ()
{   
while read filename; do 
	#only get parent directory (which is journal name)
	PARENT_DIRECTORY="$(basename "$(dirname "$filename")")"
	mkdir "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
	tar -xf "$filename" -C "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
done;
}


cd $SOURCE_DIRECTORY
find . -name "*.tar" | extract
cd /home/lionel/Documents/swissbib/git_repo/analysis/shell







