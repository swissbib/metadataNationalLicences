#!/bin/bash

# local
#DATA_BASE_DIR=/media/lionel/Data/swissbib-data/nationallizenzen/
#CODE_BASE_DIR=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/
#REPORTS=/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicencesDocumentation/_includes/quality_control/


# sb-coai2
DATA_BASE_DIR=/swissbib/harvesting/nationalLicencesData/
CODE_BASE_DIR=/swissbib/harvesting/nationalLicences/
REPORTS=/swissbib/harvesting/nationalLicencesData/



PUBLISHER=gruyter

SRC_DIR=$DATA_BASE_DIR/$PUBLISHER/source/
EXTRACTED_DIR=$DATA_BASE_DIR/$PUBLISHER/extracted/
REPORT_DIR=$REPORTS/gruyter2/
SWISSBIB_JATS_DIR=$DATA_BASE_DIR/$PUBLISHER/swissbib-jats/
XSLT_DIRECTORY=$CODE_BASE_DIR/xslt/
DTD_DIRECTORY=$CODE_BASE_DIR/dtd/


#./extract_gruyter.sh $SRC_DIR/delivery_2015_12_18/ $EXTRACTED_DIR
#./extract_gruyter.sh $SRC_DIR/delivery_2016_08_29/ $EXTRACTED_DIR
#./extract_gruyter.sh $SRC_DIR/delivery_2016_09_23/ $EXTRACTED_DIR

#./analysis_gruyter.sh $EXTRACTED_DIR $REPORT_DIR
./transform_records_gruyter.sh $EXTRACTED_DIR $SWISSBIB_JATS_DIR $XSLT_DIRECTORY $DTD_DIRECTORY







