#!/bin/bash

#on exclut les directories nommés issue-files qui regroupent des récapitulatifs d'issues
#METADATA_DIRECTORY='/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/springer'
#METADATA_DIRECTORY='/home/lionel/Documents/swissbib/testdata/testdata_nationallizenzen/springerEchantillon'
METADATA_DIRECTORY='/media/lionel/Data/swissbib-data/springer/extracted/articles'

OUTPUT_DIRECTORY=/home/lionel/Documents/swissbib/git_repo/documentation/_includes/quality_control/springer1
#OUTPUT_DIRECTORY=tests


function markdownify
#input result of grep-sed-sort-uniq like this
#      5 Text &amp; Talk
#      6 Russian Journal of Numerical Analysis and Mathematical Modelling
#      7 Statistical Applications in Genetics and Molecular Biology
#      9 Polish Journal of Surgery
#     14 Zeitschrift für Physikalische Chemie
#output markdown tables like this
#|      5| Text &amp; Talk|
#|      6| Russian Journal of Numerical Analysis and Mathematical Modelling|
#|      7| Statistical Applications in Genetics and Molecular Biology|
#|      9| Polish Journal of Surgery|
#|     14| Zeitschrift für Physikalische Chemie|
#the input file is overwritten
{
FILE_TO_MARKDOWNIFY="$1"
sed -r -e 's/^(\s*[0-9]+)\s/\1|/g ' -i $FILE_TO_MARKDOWNIFY
sed -e 's/^\s/|/g ' -i $FILE_TO_MARKDOWNIFY
sed -e 's/$/|/g ' -i $FILE_TO_MARKDOWNIFY
}


#JOURNALS
FILENAME=$OUTPUT_DIRECTORY/journals.txt
#remove spaces for this kind of case <JournalTitle>Applied Nanoscience                    </JournalTitle>
#grep -ohr '<JournalTitle>[^>]*<\/JournalTitle>' $METADATA_DIRECTORY | sed -e 's/\s*<[\/]\{0,1\}JournalTitle>//g' | sort  | uniq -ci | sort -n > $FILENAME
#markdownify $FILENAME


#ISSN-P
FILENAME=$OUTPUT_DIRECTORY/pissn.txt
#grep -ohr '<JournalPrintISSN>[^>]*<\/JournalPrintISSN>' $METADATA_DIRECTORY | sed -e 's/<[\/]\{0,1\}JournalPrintISSN>//g' | sort  | uniq -c | sort -n > $FILENAME
#markdownify $FILENAME



#DOCTYPES
FILENAME=$OUTPUT_DIRECTORY/doctypes.txt
grep -Pohr '(PUBLIC|SYSTEM).*dtd' $METADATA_DIRECTORY | sort  | uniq -c | sort -n > $FILENAME
markdownify $FILENAME


#NAMESPACES
FILENAME=$OUTPUT_DIRECTORY/namespaces.txt
grep -ohr 'xmlns:\S*\="\S*"' $METADATA_DIRECTORY | sort  | uniq -c | sort -n > $FILENAME
markdownify $FILENAME


#COPYRIGHT YEARS
FILENAME=$OUTPUT_DIRECTORY/copyright-years.txt
grep -ohr "<CopyrightYear>[^>]*<\/CopyrightYear>" $METADATA_DIRECTORY | sed -e 's/<[\/]\{0,1\}CopyrightYear>//g' | sort  | uniq -c > $FILENAME
markdownify $FILENAME

#ENCODINGS
FILENAME=$OUTPUT_DIRECTORY/encodings.txt
grep -ohr 'encoding\="[^"]*' $METADATA_DIRECTORY | sed -e 's/encoding\="//g' | sort  | uniq -ci > $FILENAME
markdownify $FILENAME



#FIELDS
FIELDS=$OUTPUT_DIRECTORY/fields.txt
#initiate writing
echo -n "" > $FIELDS



echo -n "nombre d'articles |" >> $FIELDS
grep -ohr '<\/Article>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n "doi |" >> $FIELDS
grep -ohr '<\/ArticleDOI>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n "nombre de champs journal-title |" >> $FIELDS
grep -ohr '<\/JournalTitle>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n 'nombre de article titles |' >> $FIELDS
grep -ohr '<\/ArticleTitle>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n "abstract |" >> $FIELDS
grep -ohr '<\/Abstract>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "eissn |" >> $FIELDS
grep -ohr '<\/JournalElectronicISSN>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "pissn |" >> $FIELDS
grep -ohr '<\/JournalPrintISSN>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "publisher |" >> $FIELDS
grep -ohr '<\/PublisherName>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "keywords groups |" >> $FIELDS
grep -ohr '<\/KeywordGroup>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "contrib groups |" >> $FIELDS
grep -ohr '<\/AuthorGroup>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "auteurs |" >> $FIELDS
grep -ohr '<\/Author>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "nombre d'affiliations |" >> $FIELDS
grep -ohr '<\/Affiliation>' $METADATA_DIRECTORY | wc -l  >> $FIELDS





