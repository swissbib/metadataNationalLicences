#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

import lxml.etree as ET


path = '/home/lionel/Documents/mycloud/swissbib/test-istex-mods/xml2'
xslt= ET.parse("nlm-dtd_archivearticle.xsl")
myfile = open('result.xml','w')
myfile.write("<collection>")

for file in os.listdir(path):
    current = os.path.join(path, file)
    xml=ET.parse(current)
    transform= ET.XSLT(xslt)
    newxml=transform(xml)

    myfile.write("<record>")
    myfile.write(ET.tostring(newxml, pretty_print=True))
    myfile.write("</record>\n\n\n\n")

myfile.write("</collection>")