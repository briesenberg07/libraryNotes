from sys import argv

script, filename = argv

# Okay, so this basically gets the file into memory as I understand it. It doesn't read it out to standard output,
    # it just 'gets it ready to do stuff'
txt = open(filename)

# Prints the 'a little message' giving the filename
print(f"Here's your file {filename}:")

# Here's where we do stuff:
    # So there is an order to this, and functions within functions
    # print function > open function, with filename argument > read command
    # Or should these be thought of from right-to-left?
    # read command > open function, with filename argument (so, the opened file) > print function (so, printing the opened file)
print(txt.read())

# Doing the same thing, essentially, as above, except that now we are getting the filename from input, *not* from argv
print("Type the filename again:")
file_again = input(">")

txt_again = open(file_again)

print(txt_again.read())

txt.close()
txt_again.close()
