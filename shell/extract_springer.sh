#!/bin/bash
#extract springer zip files

#Input
#    source
#    ├── ftp_PUB_16-02-02_06-41-18.zip
#    ├── ftp_PUB_16-02-03_05-41-12.zip
#    ├── ftp_PUB_16-02-04_05-55-24.zip
#    ├── ...


# the zip ftp_PUB_16-02-02_06-41-18.zip has the following structure
#├── JOU=00003
#│   ├── VOL=2006.1
#│   │   ├── ISU=1
#│   │   │   ├── ART=1
#│   │   │   │   └── 3_2006_Article_0001.xml.Meta
#│   │   │   ├── ART=10
#│   │   │   │   └── 3_2006_Article_0010.xml.Meta
#│   │   │   ├── ART=11
#│   │   │   │   └── 3_2006_Article_0011.xml.Meta
#│   │   │   ├── ...
#│   │   ├── ISU=2
#│   │   │   ├── ART=11
#│   │   │   │   └── 3_2006_Article_0011.xml.Meta
#│   │   │   ├── ART=12
#│   │   │   │   └── 3_2006_Article_0012.xml.Meta
#│   │   │   ├── ART=13
#│   │   │   │   └── 3_2006_Article_0013.xml.Meta
#│   │   │   ├── ...
#├── JOU=00004
#│   ├── VOL=2005.1
#│   │   ├── ISU=1
#│   │   │   ├── ART=1
#│   │   │   │   └── 3_2005_Article_0001.xml.Meta
#│   │   │   ├── ART=10
#│   │   │   │   └── 3_2005_Article_0010.xml.Meta
#│   │   │   ├── ART=11
#│   │   │   │   └── 3_2005_Article_0011.xml.Meta
#│   │   │   ├── ...
#│   │   ├── ISU=2
#│   │   │   ├── ART=11
#│   │   │   │   └── 3_2005_Article_0011.xml.Meta
#│   │   │   ├── ART=12
#│   │   │   │   └── 3_2005_Article_0012.xml.Meta
#│   │   │   ├── ART=13
#│   │   │   │   └── 3_2005_Article_0013.xml.Meta






if [ $# -ne 2 ]
then
   echo "Usage: $0 SOURCE_DIRECTORY TARGET_DIRECTORY"
   exit 1
else
   SOURCE_DIRECTORY=$1
   TARGET_DIRECTORY=$2
fi


function extract ()
{
while read filename; do
	echo $filename

    #overwrite existing files
	unzip -oq "$filename" -d $TARGET_DIRECTORY

done;
}

cd $SOURCE_DIRECTORY
#unzip files in alphabetical order and overwrite
ls | extract








