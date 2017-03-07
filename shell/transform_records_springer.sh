#!/bin/bash

if [ $# -ne 5 ]
then
   echo "Usage: $0 SOURCE_DIRECTORY TARGET_DIRECTORY XSLT_DIRECTORY DTD_DIRECTORY ERROR_VALIDATION_FILE"
   exit 1
else
   SOURCE_DIRECTORY=$1
   TARGET_DIRECTORY=$2
   XSLT_DIRECTORY=$3
   DTD_DIRECTORY=$4
   ERROR_VALIDATION_FILE=$5
fi


function convert_article ()
{
	while read file; do
	    #have an xml extension instead of .xml.Meta at the end of the filename
	    newname=$(echo $file | sed -e 's/\.xml\.Meta$/.xml/g')
	    xsltproc --novalid -o $TARGET_DIRECTORY$newname --stringparam filename $file $XSLT_DIRECTORY/springer.xsl $file
	done
}



cd $SOURCE_DIRECTORY
find . -name *.xml.Meta | convert_article


-exec  xsltproc --novalid -o $TARGET_DIRECTORY{} --stringparam filename {} $XSLT_DIRECTORY/springer.xsl {} \;

#test the validity and write a small report

cd $TARGET_DIRECTORY

find . -name "*.xml" -type f -exec xmllint --noout --dropdtd --dtdvalid $DTD_DIRECTORY/JATS-Archiving-1-1-OASIS-MathML3-DTD/JATS-archive-oasis-article1-mathml3.dtd --nowarning 2>>$ERROR_VALIDATION_FILE {} \;
grep -ohr "^\..*xml" $ERROR_VALIDATION_FILE | sort | uniq | wc -l
echo "invalid files"
echo " "
echo "Most common errors: "
more $ERROR_VALIDATION_FILE | sed -e's/^[^:]*:[0-9]*://g' | sort | uniq -ci | sort -nr







