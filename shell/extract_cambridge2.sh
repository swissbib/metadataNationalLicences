#!/bin/bash
#extract cambridge zip files
#this is for files delivered after platform change (September 2016)

#Input
#    original-zip
#    ├── ACL
#    │   ├── ACL1.zip (one zip per issue)
#    │   ├── ACL2.zip
#    │   ├── ...
#    ├── AEE
#    │   ├── AEE1.zip
#    │   ├── AEE2.zip
#    │   ├── ...

# the zip ACL1.zip has the following structure
# no directory, directly the list of articles

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
while read fullname; do

    FILENAME="$(basename $fullname)"

	PARENT_DIRECTORY="$(echo $FILENAME | sed 's/[0-9].*\.zip//g')"
	#the tar gz files don't have an issue directory, there is only an abstracts directory
	CHILD_DIRECTORY="$(echo $FILENAME | sed 's/\.zip//g')"
	mkdir -p "$TARGET_DIRECTORY""$PARENT_DIRECTORY"/"$CHILD_DIRECTORY"
	unzip -oq -d "$TARGET_DIRECTORY""$PARENT_DIRECTORY"/"$CHILD_DIRECTORY" "$fullname"
done;
}


cd $SOURCE_DIRECTORY
find . -name "*.zip" | extract






