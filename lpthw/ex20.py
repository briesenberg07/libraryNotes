# I'm going to capitalize the first word in my comments--because I want to
# OK here we import the argv [function? module?] from the sys [module? package?]
    # This is what will allow the script to, in my words, collect and use command-line arguments
from sys import argv

# The first CL argument shall go into a var called "script", the second LC arg shall go into a variable called "input_file"
script, input_file = argv

# SEE docs.python.org for V3.6 > 7.2.1. Methods of File Objects <https://docs.python.org/3.6/tutorial/inputoutput.html#methods-of-file-objects>
# * WHAT IS F??? Seems that it is shorthand for "file"--but would a letter other than f work?? I believe that it would.

# We define a function called "print_all" with one argument, "f"*
    # I CHANGED THE Fs TO Xs because I wanted to know whether somehow the var name "f" was set...somewhere else, or whether it could be any name.
    # Per LPTHW, "The f is a variable just like you had in other functions [...], except this time it's a file."
def print_all(x):
    # NOW IS WHERE IT GETS TO STUFF I DON'T QUITE KNOW YET
    # We are using a method or function with "f"--read. Once we have read f, we print the result to standard output.
    print(x.read(), end = "")

# Define "rewind" with one argument "f"*
def rewind(x):
    # This function will seek ("to change the file object's position") the 1st byte in the file (go to the byte with an offset of 0)
    x.seek(0)

# Define "print_a_line" with two args: line_count, and--again--"f"*
def print_a_line(line_count, x):
    # readline ("reads a single line from the file") of "f", and prints this out preceeded by the value of var line_count
    # NOTE AGAIN that what is called "line_count" here could be called something else later--in fact the var name used for this function later will be "current_line"
    print(line_count, x.readline(), end = "")

# Opens the input_file--in my language, I'd say that this opened file becomes the value of the var current_file
current_file = open(input_file)

# Print a line of text followed by a newline
print("First let's print the whole file:\n")

# Call the print_all function, so:
    # print(f.read) = read the file, then print it out
print_all(current_file)

# Print a line of text
print("Now let's rewind, kind of like a tape.")

# Call the rewind function, so:
    # f.seek(0) = seek the 1st position (the position with a 0 offset) in the file ("f")
rewind(current_file)

print("Let's print three lines:")

# In the 3 lines of code below that start with "current_line," we are iteratively re-defining the current_line variable
# Here it is 1, next it will be 1 (value at the start of that line of code) plus 1, next it will be 2 (value at the start of that line of code) plus one...
current_line = 1
# My question about this is to confirm that readline "marks its place" at the end of each line it reads, starting again at the beginning of the next line.
    # Based on documentation at link above, it *seems* that it does this, but it isn't really explicit
    # Also see author's comments in ex20
print_a_line(current_line, current_file)

# Previously: current_line = current_line +1
    # But now, per SD 5, using += ("addition assignment") instead
current_line += 1
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)

# SQ 2: "Write out what current_line is equal to on each function call [did this above] and trace how it becomes line_count in print_a_line"
    # Well, I mean, it becomes line_count in print_a_line because here (L52, 55, 58) it is the first argument passed to the function. Right??
