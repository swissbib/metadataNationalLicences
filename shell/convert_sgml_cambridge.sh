#!/bin/bash
#convert sgml to xml, one journal after another taking .sgm files

COUNTER=0

#test
#SOURCE_DIRECTORY=/home/lionel/Documents/data-swissbib-no-backup/testdata/testdata_nationallizenzen/cambridge-sgml/
#TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/sgml_converted/

#prod
#SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/content
SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/sgml-in-xml-files/
TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/sgml-in-xml-converted/

function convert_article ()
{
    while read filename; do
        newname=$(basename $filename .xml)".xml"
        newdirectory=$(dirname $filename)
        mkdir -p $1/$newdirectory

        #-E0 : ignore all errors, otherwise some sgm files are not fully parsed
        osx -x no-nl-in-tag -E0 $filename > $1/$newdirectory/$newname
    done
}


function convert_journal ()
{   # merge all the xml files of a subdirectory like 1213/. 
	while read directory; do
		
		cd $directory
		echo $COUNTER convert directory "$directory"
		full_target_directory=$TARGET_DIRECTORY$directory/
		#mkdir $full_target_directory
		find . -name \*.xml | convert_article $full_target_directory
		cd ..

		let COUNTER=COUNTER+1 

	done	
}


cd $SOURCE_DIRECTORY
#process sgml files stored in *.xml :
ls -A | convert_journal
#cat /media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/content/directory.txt | convert_journal







