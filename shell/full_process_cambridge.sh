#!/bin/bash

#local
#DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
#CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
#DTD_DIRECTORY=/home/lionel/Documents/mycloud/swissbib/dtd/


# sb-coai2
DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/
REPORTS=/swissbib/harvesting/nationalLicencesData/

PUBLISHER=cambridge

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
REPORT_DIR=$REPORTS/cambridge2/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/


./extract_cambridge.sh $SRC_DIR/delivery_2016_02_26/ $EXTRACTED_DIR
./extract_cambridge2.sh $SRC_DIR/delivery_2016_09_07/ $EXTRACTED_DIR
./extract_cambridge2.sh $SRC_DIR/delivery_2016_09_13/ $EXTRACTED_DIR

./rename_cambridge.sh $EXTRACTED_DIR
./transform_records_cambridge.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY
