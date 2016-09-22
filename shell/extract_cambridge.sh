#!/bin/bash
#extract cambridge zip files

#Input
#    original-zip
#    ├── ACL
#    │   ├── ACL1.zip (one
#    │   ├── ACL2.zip
#    │   ├── ...
#    ├── AEE
#    │   ├── AEE1.zip
#    │   ├── AEE2.zip
#    │   ├── ...

# the zip ACL1.zip has the following structure
# in /app/cjo/content/ACL/ACL1/ you can find all the articles

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
find . -name "*.zip" | while read filename; do unzip -o -d $TARGET_DIRECTORY "$filename"; done;








