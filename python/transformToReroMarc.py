#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

import lxml.etree as ET


path = '/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/python/marcxml/'

xslt= ET.parse("/home/lionel/Documents/mycloud/swissbib/git_repo/metadataNationalLicences/xslt/swissbibMarcToReroDocMarc.xsl")

transform= ET.XSLT(xslt)

myfile = open('rerodocmarc.xml','w')
myfile.write("<collection>\n")

for (dirpath, dirnames, files) in os.walk(path):
    for file in files:
        xml=ET.parse(path+file)
        transform= ET.XSLT(xslt)
        newxml=transform(xml)

        myfile.write(ET.tostring(newxml))
        myfile.write("\n")

myfile.write("</collection>")