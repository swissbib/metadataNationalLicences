#!/bin/bash

# local
#DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
#CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
#REPORTS=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicencesDocumentation/_includes/quality_control/


# sb-coai2
DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/
LOG_DIR=/swissbib/harvesting/nationalLicencesLog/
DATE=`date +%Y-%m-%d:%H:%M:%S`
PUBLISHER=gruyter

LOG_FILE=$LOG_DIR/$PUBLISHER-$DATE.log
ERR_FILE=$LOG_DIR/$PUBLISHER-$DATE.err

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/
MERGED_DIRECTORY=$CODE_BASE_DIR/$PUBLISHER/merged/


#./extract_gruyter.sh $SRC_DIR/delivery_2015_12_18/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
#./extract_gruyter.sh $SRC_DIR/delivery_2016_08_29/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
#./extract_gruyter.sh $SRC_DIR/delivery_2016_09_23/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE

#./analysis_gruyter.sh $EXTRACTED_DIR $REPORT_DIR
./transform_records_gruyter.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY >> $LOG_FILE 2>> $ERR_FILE
./merge_records_gruyter.sh $SWISSBIB_JATS_DIR $MERGED_DIRECTORY >> $LOG_FILE 2>> $ERR_FILE







