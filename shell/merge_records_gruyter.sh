#!/bin/bash

COUNTER=0

#test
#SOURCE_DIRECTORY=/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/de_gruyter/journals
#TARGET_DIRECTORY=/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/springer-three-journals/merged/

# list of all files, relative to the directory where the issue folders are
# created with find . -name "*.xml" -not -path "*issue-files/*" (in the "j" folder
#LIST_FILES=/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/de_gruyter/list_of_files.txt

#prod
SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/degruyter/azbd/extracted/j/
TARGET_DIRECTORY=/home/lionel/Documents/data-swissbib-no-backup/gruyter/azbd/
LIST_FILES=/media/lionel/Data/swissbib-data/degruyter/azbd/list_of_files.txt

function merge_records ()
{   # merge all the xml files of all directories starting with the same letters (like pjs)
	while read journal_abbrev; do
		
		GREP_EXPRESSION=^.\/"$journal_abbrev"*

		filename="$TARGET_DIRECTORY"gruyter-"$journal_abbrev".xml

		echo $COUNTER merge journal "$journal_abbrev"	

		cat $(grep "$GREP_EXPRESSION" "$LIST_FILES")  > $filename


		#remove xml declaration
        sed -e 's/<?xml[^>]*?>//g' -i $filename



		#remove doctype declaration (may be split over two lines)
		sed -e 's/<!DOCTYPE[^>]*>\{0,1\}//g' -i $filename
		sed -e 's/.*\.dtd">//g' -i $filename


		#add xml declaration at the beginning and root tag
		sed -e '1i<collection>' -i $filename		
		sed -e '1i<?xml version=\"1.0\" encoding=\"UTF-8\" ?>' -i $filename
		echo "</collection>" >> $filename
		let COUNTER=COUNTER+1 

	done	
}


cd $SOURCE_DIRECTORY
# de gruyter : one directory per issue
# get a list of journal abbreviation (the beginning of each folder name)
ls | grep -o "^[a-zA-Z0-9]*\." | sed -e 's/\.$//g' | sort | uniq | merge_records
#cat /home/lionel/Documents/swissbib/git_repo/analysis/shell/directory_redo.txt | merge_records








