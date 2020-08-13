# ASSIGNMENT DETAILS:
    # 1. Using PyMARC, write a program to extract all 100 fields from a batch of MARC records and print them to the screen.
    # 2. Using PyMARC, write a program to add a 655 field with the text Academic theses to each record in a batch.

from pymarc import *

with open('marcfile.mrc', 'rb') as of:
    mrf = MARCReader(of)

    for record in mrf:
        print(record['100'])

    for record in mrf:
        record = next(of)
        record.add_field(
            Field(
            tag = '655',
            indicators = ['#','4'],
            subfields = ['a','Academic theses']
            ))

with open('newMarcfile.mrc', 'wb') as out:
    out.write(record.as_marc())
