#!/bin/bash


DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
DTD_DIRECTORY=/home/lionel/Documents/mycloud/swissbib/dtd/

PUBLISHER=cambridge
SOURCE_DIRECTORY=$DATA_BASE_DIR/$PUBLISHER/source/delivery_2016_08_29/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/

./extract_cambridge.sh $SOURCE_DIRECTORY $EXTRACTED_DIR
./rename_cambridge.sh $EXTRACTED_DIR
./transform_records_cambridge.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY
