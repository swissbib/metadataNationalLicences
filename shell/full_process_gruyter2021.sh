#!/bin/bash

# local
#DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
#CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
#LOG_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/log/
#REPORT_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/log/


# sb-coai2
DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/
LOG_DIR=/swissbib/harvesting/nationalLicencesLog/
REPORT_DIR=/swissbib/harvesting/nationalLicencesLog/Reports/



DATE=`date +%Y-%m-%d:%H:%M:%S`
PUBLISHER=gruyter

LOG_FILE=$LOG_DIR/$PUBLISHER-$DATE.log
ERR_FILE=$LOG_DIR/$PUBLISHER-$DATE.err
ERROR_VALIDATION_FILE=$LOG_DIR/$PUBLISHER-$DATE-error-validation.txt

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
MERGED_DIR=$DATA_BASE_DIR/$PUBLISHER/merged/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/



#./extract_gruyter.sh $SRC_DIR $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
./extract_gruyter.sh $SRC_DIR/delivery_2019_04_12/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
./extract_gruyter.sh $SRC_DIR/from-2019-04-04-to-2020-07-02/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE

./analysis_gruyter.sh $EXTRACTED_DIR $REPORT_DIR

./transform_records_gruyter.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY $ERROR_VALIDATION_FILE >> $LOG_FILE 2>> $ERR_FILE
./merge_records_gruyter.sh $SWISSBIB_JATS_DIR $MERGED_DIR >> $LOG_FILE 2>> $ERR_FILE







