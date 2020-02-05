# Directions are to use read and argv to read the file I just created

# Using argv as per instructions
from sys import argv
script, filename = argv

print(f"So you've just input, as the second CL argument, the filename {filename}.\nThis script will now open that file in write mode.")

# Creating the target variable here as in ex16 but to be honest I'm not quite sure why I have to
    # To-do: Figure out if/why I have to
    # Why not just open(filename, 'w') here and filename.write(line1), etc. below??
target = open(filename, 'w')

# Same as ex16--need something to print later.
print("Now I'm going to ask you for three lines. Please make up three words and enter one on each line.")

line1 = input("Made-up word 1: ")
line2 = input("Made-up word 2: ")
line3 = input("Made-up word 3: ")

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)

target.close()

print(f"Now let's see what you made up--let's read {filename}.")
read_it = open(filename)
print(read_it.read())

# This isn't returning an error, but is it really working?
read_it.close()
