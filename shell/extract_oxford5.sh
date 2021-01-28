#!/bin/bash
#extract oxford tar files in one directory per journal with subfolder per issues (standard would be one directory per issue)
#2nd delivery : all tar files in the same directory, mixed with tar.gz

#Input
#    source
#    ├── socpol.zip
#    ├── socpro.zip



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
	#create a directory per journal (directory name is the beginning of the archive filename)
	echo $filename
	PARENT_DIRECTORY="$(echo $filename | sed 's/[0-9].*\.zip//g')"
	mkdir -p "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
	unzip -oq  -d "$TARGET_DIRECTORY""$PARENT_DIRECTORY" "$filename" "*.xml"
done;
}

cd $SOURCE_DIRECTORY
find . -name "*.zip" | extract








