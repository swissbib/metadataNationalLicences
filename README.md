# Swissbib - National Licences

## Introduction

This is the code for the processing of the articles from the Swiss National Licences.

More information on the general project on <http://www.nationallizenzen.ch>.

## Workflow

See the [hyperlinked description of the workflow](http://swissbib.github.io/metadataNationalLicencesDocumentation/public/images/big-picture.svg)

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



