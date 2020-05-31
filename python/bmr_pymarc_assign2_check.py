# Import all functions from the PyMARC library
from pymarc import *

# ... I've never used 'with' before!
with open('newMarcfile.mrc', 'rb') as openFile:
    mrFile = MARCReader(openFile)
    for record in mrFile:
        print(record['655'])
