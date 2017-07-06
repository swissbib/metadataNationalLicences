#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import zipfile

#Input
#    source
#    ├── Archives of Clinical Neuropsychology
#    │   ├── acn_10_1.pdf.zip (one issue per archive with all the pdf)
#    │   ├── acn_10_2.pdf.zip
#    │   ├── ...
#    ├── Cardiovascular Research
#    │   ├── cardiovascres_31_1.pdf.zip
#    │   ├── cardiovascres_31_2.pdf.zip
#    │   ├── ...


# out of 2 million zipped pdf's, I just want to extract 10'000 corresponding to some folders and filenames

# for all folders
#     process_one_journal(folder, filenames[journal_id[folder]])
#
#
#
def process_one_journal(folder, filenames_list, destination, journals_id):
     '''
     :param folder:
     :param filenames_list:
     :param destination:
     :return:
     '''
     journal_folder_name=os.path.basename(folder)
     destination_folder=destination+'/'+journals_id[journal_folder_name]
     os.mkdir(destination_folder)
     for (dirpath, dirnames, files) in os.walk(folder):
        for file in files:
            extract_selected_fulltexts(dirpath+'/'+file, filenames_list, destination_folder)


def extract_selected_fulltexts(zip_archive,filenames_list,destination):
    '''takes a zip archive, unzip only the files which have filenames in filenames_list to the destination'''
    zf=zipfile.ZipFile(zip_archive,'r')
    for filename in filenames_list:
        if filename in zf.namelist():
            zf.extract(filename, destination)





# Main part
journals_id={}
journals_id["Annals of Botany"]="annbot"
journals_id["FEMS Microbiology Ecology"]="femsec"


filenames={}
filenames["annbot"]=[]
filenames["annbot"].append("725.pdf")
filenames["annbot"].append("780459.pdf")
filenames["femsec"]=[]
filenames["femsec"].append("76-1-133.pdf")
filenames["femsec"].append("76-1-26.pdf")
filenames["femsec"].append("77-2-285.pdf")





source="/media/lionel/Data/swissbib-data/nationallizenzen/oxford/sample-pdf-zip"

destination="/media/lionel/Data/swissbib-data/nationallizenzen/oxford/pdf"

for (dirpath, dirnames, files) in os.walk(source):
    for folder in dirnames:
        process_one_journal(dirpath+"/"+folder, filenames[journals_id[folder]],destination, journals_id)




