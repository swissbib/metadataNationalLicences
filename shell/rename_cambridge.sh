#!/bin/bash
#renames .xml files which are indeed SGML files. They get the extension .sgm.

if [ $# -ne 1 ]
then
   echo "Usage: $0 EXTRACTED_DIRECTORY"
   exit 1
else
   EXTRACTED_DIRECTORY=$1
fi

function rename ()
{
	while read filename; do
		directory=$(dirname $filename)
		newname=$(basename $filename .xml)".sgm"
		mv $filename $directory/$newname
	done
}



cd $EXTRACTED_DIRECTORY
grep -rL "<?xml" --include="*.xml" > files.txt
cat files.txt | rename