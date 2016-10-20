#!/bin/bash
#extract oxford tar files in one directory per journal with subfolder per issues (standard would be one directory per issue)
#2nd delivery : all tar files in the same directory, mixed with tar.gz

#Input
#    source
#    ├── socpol.tar.gz
#    ├── socpro.tar
#    ├── socrel77-1.tar
#    ├── socrel.tar.gz
#    ├── spp.tar.gz
#    ├── ssjapj19-1.tar
#    ├── stalaw.tar.gz
#    ├── swra.tar.gz
#    ├── swr.tar.gz



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








