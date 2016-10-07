#!/bin/bash


DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
DTD_DIRECTORY=/home/lionel/Documents/mycloud/swissbib/dtd/

PUBLISHER=cambridge
SOURCE_DIRECTORY=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted-delivery-2016-09/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/

#./extract_cambridge2.sh $SOURCE_DIRECTORY/delivery_2016_09_07/ $EXTRACTED_DIR
#./extract_cambridge2.sh $SOURCE_DIRECTORY/delivery_2016_09_13/ $EXTRACTED_DIR
./rename_cambridge.sh $EXTRACTED_DIR
#./transform_records_cambridge.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY
