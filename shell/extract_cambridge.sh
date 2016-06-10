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



SOURCE_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/original_zip/
TARGET_DIRECTORY=/media/lionel/Data/swissbib-data/cambridge/extracted/


cd $SOURCE_DIRECTORY
#don't extract table of contents for issues
find . -name "*.zip" | while read filename; do unzip -o -d $TARGET_DIRECTORY "$filename"; done;








