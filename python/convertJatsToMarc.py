#!/usr/bin/python
# -*- coding: utf-8 -*-

import jats_utils_reviewed

from xml.dom.minidom import Element, parseString

jats_parser = jats_utils_reviewed.JATSParser()

result1=jats_parser.get_record('../data-samples/cambridge/articles/JATS_1.0/S0024282914000401h.xml','cambridge')
f=open('record-cambridge.xml', 'w+')
f.write(result1)

result2=jats_parser.get_record('/media/lionel/Data/swissbib-data/degruyter/transformed/j/abitech.2007.27.3/abitech.2007.27.3.160/abitech.2007.27.3.160.xml','gruyter')
f=open('record-gruyter.xml', 'w+')
f.write(result2)


result3=jats_parser.get_record('../data-samples/oxford/article/JATS_1.1/acv038.xml','oxford')
f=open('record-oxford.xml', 'w+')
f.write(result3)