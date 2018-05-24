#!/bin/bash

# local
#DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
#CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
#LOG_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/test-full/log/

# sb-coai2
DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/
LOG_DIR=/swissbib/harvesting/nationalLicencesLog/


DATE=`date +%Y-%m-%d:%H:%M:%S`

PUBLISHER=springer

LOG_FILE=$LOG_DIR/$PUBLISHER-$DATE.log
ERR_FILE=$LOG_DIR/$PUBLISHER-$DATE.err
ERROR_VALIDATION_FILE=$LOG_DIR/$PUBLISHER-$DATE-error-validation.txt

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/part1
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/
MERGED_DIR=$DATA_BASE_DIR/$PUBLISHER/merged/



./extract_springer.sh $SRC_DIR/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
#./transform_records_springer.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY $ERROR_VALIDATION_FILE >> $LOG_FILE 2>> $ERR_FILE
#./merge_records_oxford.sh $SWISSBIB_JATS_DIR $MERGED_DIR >> $LOG_FILE 2>> $ERR_FILE

