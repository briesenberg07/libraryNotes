print("Please input filename here: ")
filename = input(">")
txt = open(filename)
print(txt.read())

txt.close()
# "Closing the file" seems to work here--did it really?
# How to close file in ex15b?
