#!/bin/bash

#on exclut les directories nommés issue-files qui regroupent des récapitulatifs d'issues
METADATA_DIRECTORY='/media/lionel/Data/swissbib-data/cambridge/extracted/app/cjo/content'
OUTPUT_DIRECTORY=/home/lionel/Documents/swissbib/git_repo/documentation/_includes/quality_control/cambridge1

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
grep -ohr '<journal-title>.*<\/journal-title>' $METADATA_DIRECTORY | sed -e 's/<[\/]\{0,1\}journal-title>//g' | sort  | uniq -ci | sort -n > $FILENAME
markdownify $FILENAME


#ISSN-P
FILENAME=$OUTPUT_DIRECTORY/pissn.txt
grep -ohr '<issn pub-type\=\"ppub\">[^>]*<\/issn>' $METADATA_DIRECTORY | sed -e 's/<[\/]\{0,1\}issn[^>]*>//g' | sort  | uniq -c | sort -n > $FILENAME
markdownify $FILENAME



#DOCTYPES
FILENAME=$OUTPUT_DIRECTORY/doctypes.txt
#doctypes for cambridge are split over multiple lines
grep -ohrE '(PUBLIC|SYSTEM|public|system)[^>]*dtd\">' $METADATA_DIRECTORY | sort  | uniq -c | sort -n > $FILENAME
markdownify $FILENAME


#NAMESPACES
FILENAME=$OUTPUT_DIRECTORY/namespaces.txt
grep -ohr 'xmlns:\S*\="\S*"' $METADATA_DIRECTORY | sort  | uniq -c | sort -n > $FILENAME
markdownify $FILENAME


#COPYRIGHT YEARS
FILENAME=$OUTPUT_DIRECTORY/copyright-years.txt
grep -ohr "<copyright-year>.*<\/copyright-year>" $METADATA_DIRECTORY | sed -e 's/<[\/]\{0,1\}copyright-year>//g' | sort  | uniq -c > $FILENAME
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
grep -ohr '<\/article>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n "doi |" >> $FIELDS
grep -ohr '<article-id pub-id-type\=\"doi\">' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n "nombre de champs journal-title |" >> $FIELDS
grep -ohr '<\/journal-title>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n 'nombre de champs abbrev-journal-title abbrev-type=full |' >> $FIELDS
grep -ohr '<abbrev-journal-title abbrev-type\=\"full\">' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n 'nombre de article titles |' >> $FIELDS
grep -ohr '<\/article-title>' $METADATA_DIRECTORY | wc -l  >> $FIELDS

echo -n "abstract |" >> $FIELDS
grep -ohr '<abstract>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "eissn |" >> $FIELDS
grep -ohr '<issn pub-type\=\"epub\">' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "pissn |" >> $FIELDS
grep -ohr '<issn pub-type\=\"ppub\">' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "publisher |" >> $FIELDS
grep -ohr '<\/publisher-name>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "keywords groups |" >> $FIELDS
grep -ohr '<\/kwd-group>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "contrib groups |" >> $FIELDS
grep -ohr '<\/contrib-group>' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "auteurs |" >> $FIELDS
grep -ohr '<contrib contrib-type\=\"author\"' $METADATA_DIRECTORY | wc -l >> $FIELDS

echo -n "nombre d'affiliations |" >> $FIELDS
grep -ohr '<\/aff>' $METADATA_DIRECTORY | wc -l  >> $FIELDS





