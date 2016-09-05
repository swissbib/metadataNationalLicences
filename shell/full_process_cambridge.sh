#!/bin/bash

./extract_cambridge.sh
./rename_cambridge.sh
./transform_records_cambridge.sh
cd /var/swissbib/dbbu/nationallizenzen/transformed/cambridge

find . -name "*.xml" -type f -exec xmllint --noout --dropdtd --dtdvalid ../../dtd/JATS-Archiving-1-1-OASIS-MathML3-DTD/JATS-archive-oasis-article1-mathml3.dtd --nowarning 1>>log.txt 2>>error-validation.txt {} \;
grep -ohr "^\..*xml" error-validation.txt | sort | uniq | wc -l >>report.txt
echo "invalid files">>report.txt
echo " ">>report.txt
echo "Most common errors: ">>report.txt
more error-validation.txt | sed -e's/^[^:]*:[0-9]*://g' | sort | uniq -ci | sort -nr >> report.txt