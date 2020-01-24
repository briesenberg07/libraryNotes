from sys import argv
script, filename = argv
print(open(filename).read())

# How to close my file here?
# Or is there a need to?

open(filename).close()
