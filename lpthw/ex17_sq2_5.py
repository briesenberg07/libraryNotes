from sys import argv
from os.path import exists

script, from_file, to_file = argv

print(f"Copying from {from_file} to {to_file}")

# SQ2 to-do: Combine these lines
    # OK, here's a maybe quick-and-dirty way. Apparently semicolons aren't great...
in_file = open(from_file) ; indata = in_file.read()

# What about using the Python 'with' statement and indent?
    # Alexis suggests something along the lines of:
    # `with open()
    #   do stuff here`
    # But I don't really know what it means

print(f"""
    Some information:
    The input file is {len(indata)} bytes long
    Output file already exists--T or F: {exists(to_file)}
    """)

# SQ2 to-do: Combine these lines
out_file = open(to_file, 'w') ; out_file.write(indata)

# SQ5: Why do I have to write out_file.close() in the code?
    # Because it's a good practice? Is that it??
    # ...
out_file.close()
in_file.close()
