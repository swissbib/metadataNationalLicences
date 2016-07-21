#!/bin/bash



SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_delivery_extracted/


TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/oxford/2nd_delivery_transformed/

cd $SOURCE_DIRECTORY
find . -name *.xml -exec  xsltproc -o $TARGET_DIRECTORY{} ~/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/xslt/nlm-2-to-jats-1-1.xsl {} \;











