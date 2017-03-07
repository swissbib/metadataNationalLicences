#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

import lxml.etree as ET


path = '/media/lionel/Data/swissbib-data/nationallizenzen/'

#steps=['gruyter1', 'gruyter2', 'gruyter3', 'gruyter4','oxford1', 'oxford2', 'oxford3', 'oxford4','cambridge1', 'cambridge2', 'cambridge3', 'cambridge4']
steps=['springer1']


xslt= ET.parse("/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/xslt/istex-springer-A++V2.4.xsl")

transform= ET.XSLT(xslt)

for step in steps:

    files_list = open ('../filenames/'+step+'.txt', 'r')
    myfile = open('../mods/'+step+'-mods.xml','w')
    myfile.write("<collection>")



    #writes an array with all files
    with files_list as f:
        list = f.read().splitlines()


    for file in list:
        publisher='/'+step[:-1]
        current=os.path.join(path+publisher+'/extracted/',file)
        print file
        xml=ET.parse(current)
        transform= ET.XSLT(xslt)
        newxml=transform(xml)

        myfile.write("<record>")
        myfile.write(ET.tostring(newxml))
        myfile.write("</record>\n")

    myfile.write("</collection>")
