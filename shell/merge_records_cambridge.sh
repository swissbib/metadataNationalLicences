#!/bin/bash

COUNTER=0

if [ $# -ne 2 ]
then
   echo "Usage: $0 SOURCE_DIRECTORY TARGET_DIRECTORY"
   exit 1
else
   SOURCE_DIRECTORY=$1
   TARGET_DIRECTORY=$2
fi

function merge_records ()
{   # merge all the xml files of a subdirectory like 1213/. 
	while read directory; do
		
		cd $directory
		echo $COUNTER merge directory "$directory"
		filename="$TARGET_DIRECTORY"cambridge-"$directory".xml
		find . -name "*.xml" -exec cat {} \; > $filename
		cd ..


		#remove xml declaration
        sed -e 's/<?xml[^>]*?>//g' -i $filename

		#remove doctype declaration (may be split over two lines)
		sed -e 's/<!DOCTYPE[^>]*>\{0,1\}//g' -i $filename
		sed -e 's/.*shing.*dtd">//g' -i $filename

		#entities problems :
        sed -e 's/&copy;/c/g' -i $filename
        sed -e 's/&ndash;/-/g' -i $filename


		#add xml declaration at the beginning and root tag
		sed -e '1i<collection>' -i $filename		
		sed -e '1i<?xml version=\"1.0\" encoding=\"UTF-8\" ?>' -i $filename
		echo "</collection>" >> $filename
		let COUNTER=COUNTER+1 

	done	
}


cd $SOURCE_DIRECTORY
ls -A | merge_records
#cat /home/lionel/Documents/swissbib/git_repo/analysis/shell/directory_redo.txt | merge_records








