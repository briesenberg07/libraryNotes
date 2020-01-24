from sys import argv

script, filename = argv

txt = open(filename)

print(f"Here's your file {filename}:")
print(txt.read())

# This seems to work for "closing the file"--did it really work?
txt.close()

# Why can't I "close the file" in ex15b?
