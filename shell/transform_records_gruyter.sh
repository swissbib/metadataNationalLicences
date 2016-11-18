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


cd $SOURCE_DIRECTORY

find . -name *.xml -not -path "*issue-files/*" -exec  xsltproc --novalid -o $TARGET_DIRECTORY{} --stringparam filename {} $XSLT_DIRECTORY/gruyter.xsl {} \;

#test the validity and write a small report

cd $TARGET_DIRECTORY
find . -name "*.xml" -type f -exec xmllint --noout --dropdtd --dtdvalid $DTD_DIRECTORY/JATS-Archiving-1-1-OASIS-MathML3-DTD/JATS-archive-oasis-article1-mathml3.dtd --nowarning 2>>$ERROR_VALIDATION_FILE {} \;
grep -ohr "^\..*xml" $ERROR_VALIDATION_FILE | sort | uniq | wc -l
echo "invalid files"
echo " "
echo "Most common errors: "
more $ERROR_VALIDATION_FILE | sed -e's/^[^:]*:[0-9]*://g' | sort | uniq -ci | sort -nr











