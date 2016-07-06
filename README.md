# Swissbib - National Licences

## Introduction

This is the code for the processing of the articles from the Swiss National Licences.

More information on the general project on <http://www.nationallizenzen.ch>.

## Workflow

 * Extract archives (shell scripts)
 * Do preliminary analysis, for example to get all DTD's of the articles (shell scripts)
 * Merge all articles of the same journal (shell script)
 * Index (metafacture+elasticsearch)
 * Analyze + extract title lists (python)

## Quick start

 * [Extract all zip files from Oxford](shell/extract_oxford.sh)
 * [example of an article with JATS metadata](data-samples/cambridge/articles/JATS_1.0/S0024282914000401h.xml)
 * [merge all articles from Oxford (900'000 files) in one big xml file per jounrnal](shell/merge_records_oxford.sh)
 * [example of all articles from a specific journal in one xml file](data-samples/cambridge/journal/fromXML/cambridge-DSJ.xml)
 * [do a quick analysis for Oxford, extract for example the DTD's](shell/analysis_oxford.sh)
 * [elasticsearch mapping](elasticsearch/common_mapping.json)
 * [extract selected fields with metamorph](metafacture/jatsToElasticSearchMorph.xml)
 * [index data in elasticsearch](metafacture/jatsToElasticSearch.flux)
 * [generate title lists from elasticsearch](python/generateTitleLists.py)


## Notes

### Metafacture

To be able to use this, you need to install metafacture. We recommend installing it from
<https://github.com/linked-swissbib/mfWorkflows/>

### Special DTD handling

<https://github.com/culturegraph/metafacture-core/issues/236>

The jar file is `mf-plugin-national-licenses-0.0.5-SNAPSHOT-plugin.jar` and need to be installed in the plugin directory of metafacture

### Processing of Empty XML fields

This is a concern only when loading article xml directly in elasticsearch without using a metamorph file.

The solution is here

<https://github.com/liowalter/swissbib-metafacture-commands/tree/lionel-hack>

Way to proceed :

1. Repository klonen und in den branch lionel-hack wechseln
2. Im root-Verzeichnis des geklonten Repository: mvn clean install
assembly:assembly -Dmaven.test.skip=true
3. target/swissbibMF-plugins-0.0.5-SNAPSHOT-jar-with-dependencies.jar in
den plugins-Ordner von mfWorkflows verschieben (gleichnamige Datei
überschreiben)

Remaining Bug : there is still a problem with such cases : `<PublisherLocation /></PublisherInfo>` (empty tag followed by end tag).

