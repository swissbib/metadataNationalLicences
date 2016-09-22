#!/bin/bash
#extract gruyter zip files

#Input
#    original-zip
#    ├── abitech.1996.16.1-14498522454.zip
#    ├── abitech.1997.17.1-14498522454.zip
#    ├── ...
#    ├── abpr.1977.3.issue-4-34637461283612.zip
#    ├── abpr.1978.4.issue-1-34637461283612.zip
#    ├── ...

# the zip abpr.1977.3.issue-4-34637461283612.zip has the following structure
#    .
#    ├── j
#    │   ├── abpr.1977.3.issue-4
#    │        ├── abpr.1977.3.4.259
#    │        │   └── abpr.1977.3.4.259.xml
#    │        ├── abpr.1977.3.4.261
#    │        │   └── abpr.1977.3.4.261.xml
#    │        ├── abpr.1977.3.4.263
#    │        │   └── abpr.1977.3.4.263.xml
#    │        ├── abpr.1977.3.4.265
#    │        │   └── abpr.1977.3.4.265.xml
#    │        ├── abpr.1977.3.4.270
#    │        │   └── abpr.1977.3.4.270.xml


if [ $# -ne 2 ]
then
   echo "Usage: $0 SOURCE_DIRECTORY TARGET_DIRECTORY"
   exit 1
else
   SOURCE_DIRECTORY=$1
   TARGET_DIRECTORY=$2
fi

cd $SOURCE_DIRECTORY
#don't extract table of contents for issues
unzip -q "*.zip" -d $TARGET_DIRECTORY -x */issue-files/*








