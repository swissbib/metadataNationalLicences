#!/bin/bash



#prod
SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/degruyter/extracted/

TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/degruyter/transformed/

cd $SOURCE_DIRECTORY

#find a way to remove issue xml files (match issue in the filename?)
find . -name *.xml -not -path "*issue-files/*" -exec  xsltproc -o $TARGET_DIRECTORY{} ~/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/xslt/gruyter.xsl {} \;











