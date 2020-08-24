import pymarc

fileIn = pymarc.MARCReader(open('marcfile.mrc', 'rb'))

with open('newMarcfile.mrc', 'wb') as f:
    for records in fileIn:
        newF = pymarc.Field(
        tag = '655',
        indicators = ['\\','4'],
        subfields = ['a','Academic theses']
        )
        records.add_ordered_field(newF)
        f.write(records.as_marc21())
