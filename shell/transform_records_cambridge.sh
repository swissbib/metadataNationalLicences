#!/bin/bash

if [ $# -ne 4 ]
then
   echo "Usage: $0 SOURCE_DIRECTORY TARGET_DIRECTORY XSLT_DIRECTORY DTD_DIRECTORY"
   exit 1
else
   SOURCE_DIRECTORY=$1
   TARGET_DIRECTORY=$2
   XSLT_DIRECTORY=$3
   DTD_DIRECTORY=$4
fi



#xml only, no sgml

cd $SOURCE_DIRECTORY
find . -name *.xml -exec  xsltproc --novalid -o $TARGET_DIRECTORY{} --stringparam filename {} $XSLT_DIRECTORY/cambridge.xsl {} \;

#test the validity and write a small report

cd $TARGET_DIRECTORY
rm error-validation.txt report.txt
find . -name "*.xml" -type f -exec xmllint --noout --dropdtd --dtdvalid $DTD_DIRECTORY/JATS-Archiving-1-1-OASIS-MathML3-DTD/JATS-archive-oasis-article1-mathml3.dtd --nowarning 1>>log.txt 2>>error-validation.txt {} \;
grep -ohr "^\..*xml" error-validation.txt | sort | uniq | wc -l >>report.txt
echo "invalid files">>report.txt
echo " ">>report.txt
echo "Most common errors: ">>report.txt
more error-validation.txt | sed -e's/^[^:]*:[0-9]*://g' | sort | uniq -ci | sort -nr >> report.txt















