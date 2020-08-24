# ASSIGNMENT DETAILS:
    # 1. Using PyMARC, write a program to extract all 100 fields from a batch of MARC records and print them to the screen.
    # To go farther: Add condition to eliminate 'None' in output
    # See: https://pymarc.readthedocs.io/en/latest/index.html?highlight=marcreader#reading

# Import all functions from the PyMARC library
from pymarc import *

with open('marcfile.mrc', 'rb') as openFile:
    mrFile = MARCReader(openFile)
    for record in mrFile:
        print(record['100'])
