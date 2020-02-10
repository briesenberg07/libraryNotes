from sys import argv
from os.path import exists

script, from_file, to_file = argv

print(f"Copying from {from_file} to {to_file}")

# we could do these two on one line, how?
in_file = open(from_file)
indata = in_file.read()

# I learned: New lines in the multi-line string AND \n will give me two new lines (I only wanted one)
print(f"""
    Some information:\n
    The input file is {len(indata)} bytes long\n
    Output file already exists--T or F: {exists(to_file)}
    """)

# So basically, in my mind, input() pauses a script at that point. So removing input() will allow the script to proceed uninterrupted.
# print("Ready, hit RETURN to continue, CTRL-C to abort.")
# input()

out_file = open(to_file, 'w')
out_file.write(indata)

out_file.close()
in_file.close()
