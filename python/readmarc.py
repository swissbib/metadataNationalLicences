from pymarc import MARCReader
with open('/home/lionel/Documents/mycloud/swissbib/publishers/oxford/oupmarc_records.mrc', 'rb') as fh:
    reader = MARCReader(fh)
    print reader[0]['245']['a']
    print reader[1]['245']['a']


