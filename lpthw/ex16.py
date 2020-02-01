# Okay, according to pydoc3 documentation, this is the sys module's argv object
    # (The usage of 'object' in pydoc description of sys is a little funny to me--
    # isn't this really more of a tool/function/etc. than an 'object'?)
from sys import argv

# The first command-line argument will be the var script, the second will be the var filename
script, filename = argv

# Pretty straight-forward here with one line that uses a format string
print(f"We're going to erase {filename}.")
print("If you don't want that, hit CTRL-C (^C).")
print("If you do want that, hit RETURN.")

# Now this is a little tricksy. If CTRL+C is entered, the script stops due to something that I believe was called
    # a 'keyboard interrupt' in the error message
    # But the tricsy thing is that, really, would *any other* input allow the script to continue?
    # I mean, it doesn't necessarily have to be only RETURN, right?
    # Just any input that doesn't stop the script. I'm going to try a random alpha-numeric input and see.
        # Yes. Random alpha-numeric allowed the script to continue
input("?")

# Opening the file in write mode
print("Opening the file...")
target = open(filename, 'w')

# Truncating the file--which it turns out, in computer-speak, means to ERASE that sonofagun
print("Truncating the file. Goodbye!")
target.truncate()

print("Now I'm going to ask you for three lines.")

# HEre we get three pieces of keyboard input and turn into strings
    # What would happen if one or more of these were integers?
    # I'll try and see
        # For purposes of writing to the file there seems to be no difference between alpha and numeric input
line1 = input("line 1: ")
line2 = input("line 2: ")
line3 = input("line 3: ")

print("I'm going to write these to the file.")

# The key here (L47-52, L55) is the 'target' var; the target var is the filename provided in CLI, opened in 'w' mode. 
    # We take *this* (which has been 'captured in' [?] 'put into' [?]), and then we *do something to it*
    # The thing that I think I'm getting is that we do something by providing the var, then a period, then
    # the function(s) to use on the thing that the var is...
    # Does this make sense?
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

print("And finally, we close it.")
target.close()
