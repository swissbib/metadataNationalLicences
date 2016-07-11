#!/bin/bash

COUNTER=0

#test
#SOURCE_DIRECTORY=/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/springer-three-journals/journals/
#TARGET_DIRECTORY=/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/springer-three-journals/merged/

#prod
SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_delivery_extracted/
TARGET_DIRECTORY=/home/lionel/Documents/data-swissbib-no-backup/oxford2/

function merge_records ()
{   # merge all the xml files of a subdirectory like 1213/. 
	while read directory; do
		
		cd $directory
		echo $COUNTER merge directory "$directory"
		filename="$TARGET_DIRECTORY"oxford-"$directory".xml
		find . -name *.xml -exec cat {} \; > $filename
		cd ..


		#remove xml declaration
		sed -e 's/<?xml[^>]*?>//g' -i $filename


		#remove doctype declaration (may be split over two lines)
		sed -e 's/<!DOCTYPE[^>]*>\{0,1\}//g' -i $filename
		sed -e 's/.*shing.*dtd">//g' -i $filename


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








