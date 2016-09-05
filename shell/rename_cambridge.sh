#!/bin/bash
#renames .xml files which are indeed SGML files. They get the extension .sgm.

function rename ()
{
	while read filename; do
		directory=$(dirname $filename)
		newname=$(basename $filename .xml)".sgm"
		mv $filename $directory/$newname
	done
}


# grep -rL "<?xml" --include="*.xml" > files.txt

cd /var/swissbib/dbbu/nationallizenzen/extracted/cambridge/app/cjo/content
cat files.txt | rename