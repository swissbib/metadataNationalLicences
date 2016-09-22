#!/bin/bash


DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
REPORTS=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicencesDocumentation/_includes/quality_control/


PUBLISHER=gruyter

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/delivery_2016_08_29/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
REPORT_DIR=$REPORTS/gruyter2/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=/home/lionel/Documents/mycloud/swissbib/dtd/



#./extract_gruyter.sh $SRC_DIR $EXTRACTED_DIR
#./analysis_gruyter.sh $EXTRACTED_DIR $REPORT_DIR
./transform_records_gruyter.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY
