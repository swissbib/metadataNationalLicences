#!/bin/bash
#extract oxford tar files in one directory per journal with subfolder per issues (standard would be one directory per issue)
#2nd delivery : all tar files in the same directory

#test
#SOURCE_DIRECTORY=/home/lionel/Documents/data-swissbib-no-backup/testdata/testdata_nationallizenzen/oxford3/
#TARGET_DIRECTORY=/home/lionel/Documents/data-swissbib-no-backup/testdata/testdata_nationallizenzen/oxford3/extracted/

SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_delivery_original_zips/current_delivery/
TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_delivery_extracted/



function extract ()
{   
while read filename; do 
	#create a directory per journal (directory name is the beginning of the archive filename)
	echo $filename
	PARENT_DIRECTORY="$(echo $filename | sed 's/[0-9IXV].*\.tar//g')"
	mkdir -p "$TARGET_DIRECTORY""$PARENT_DIRECTORY"
	tar -xf "$filename" -C "$TARGET_DIRECTORY""$PARENT_DIRECTORY" --exclude="*.pdf"
done;
}

function extract-gz ()
{
while read filename; do
	#only get parent directory (which is journal name)
	echo $filename
	PARENT_DIRECTORY="$(echo $filename | sed 's/[0-9IXV].*\.tar\.gz//g')"
	#the tar gz files don't have an issue directory, there is only an abstracts directory
	CHILD_DIRECTORY="$(echo $filename | sed 's/\.tar\.gz//g')"
	mkdir -p "$TARGET_DIRECTORY""$PARENT_DIRECTORY"/"$CHILD_DIRECTORY"
	tar -xzf "$filename" -C "$TARGET_DIRECTORY""$PARENT_DIRECTORY"/"$CHILD_DIRECTORY" --exclude="*.pdf"
done;
}


cd $SOURCE_DIRECTORY
find . -name "*.tar" | extract

find . -name "*.tar.gz" | extract-gz








