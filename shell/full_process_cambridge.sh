#!/bin/bash

# local
DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/test
CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
LOG_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/log/


# sb-coai2
#DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
#CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/
#LOG_DIR=/swissbib/harvesting/nationalLicencesLog/




DATE=`date +%Y-%m-%d:%H:%M:%S`
PUBLISHER=cambridge

LOG_FILE=$LOG_DIR/$PUBLISHER-$DATE.log
ERR_FILE=$LOG_DIR/$PUBLISHER-$DATE.err
ERROR_VALIDATION_FILE=$LOG_DIR/$PUBLISHER-$DATE-error-validation.txt

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/
MERGED_DIR=$DATA_BASE_DIR/$PUBLISHER/merged/


#./extract_cambridge.sh $SRC_DIR/delivery_2016_02_26/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
#./extract_cambridge2.sh $SRC_DIR/delivery_2016_09_07/ $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE
./extract_cambridge2.sh $SRC_DIR $EXTRACTED_DIR >> $LOG_FILE 2>> $ERR_FILE

./rename_cambridge.sh $EXTRACTED_DIR
./transform_records_cambridge.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY $ERROR_VALIDATION_FILE >> $LOG_FILE 2>> $ERR_FILE
#./merge_records_cambridge.sh $SWISSBIB_JATS_DIR $MERGED_DIR >> $LOG_FILE 2>> $ERR_FILE
