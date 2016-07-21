#!/bin/bash



#xml only, no sgml
SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/content/


TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/transformed/

cd $SOURCE_DIRECTORY
find . -name *.xml -exec  xsltproc -o $TARGET_DIRECTORY{} ~/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/xslt/nlm-2-to-jats-1-1.xsl {} \;











