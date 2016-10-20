#!/bin/bash

#local
#DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
#CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/


# sb-coai2
DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/

PUBLISHER=oxford

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/


./extract_oxford.sh $SRC_DIR/delivery_2016_03_03/ $EXTRACTED_DIR
./extract_oxford2.sh $SRC_DIR/delivery_2016_04_28/ $EXTRACTED_DIR
./extract_oxford2.sh $SRC_DIR/delivery_2016_09_07/ $EXTRACTED_DIR


./transform_records_oxford.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY
