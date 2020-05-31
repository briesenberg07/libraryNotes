# ASSIGNMENT DETAILS:
    # 2. Using PyMARC, write a program to add a 655 field with the text Academic theses to each record in a batch.

from pymarc import *

# See
    # https://pymarc.readthedocs.io/en/latest/index.html?highlight=marcreader#writing
    # https://pymarc.readthedocs.io/en/latest/index.html?highlight=marcreader#updating

# This code only adds the 655 to one (the first, I believe) record in the MARC file
with open('marcfile.mrc', 'rb') as openFile:
    mrFile = MARCReader(openFile)
    record = next(mrFile)
    record.add_field(
        Field(
        tag = '655',
        indicators = ['#','4'],
        subfields = [
            'a', 'Academic theses'
        ]))

with open('newMarcfile.mrc', 'wb') as out:
    out.write(record.as_marc())
