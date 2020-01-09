from sys import argv

script, filename = argv

txt = open(filename)

print(f"Here's your file {filename}:")
print(txt.read())

print("Type the filename again:")
file_again = input(">")

txt_again = open(file_again)

print(txt_again.read())

# OK need to unpack this:
    # So L8 is* essentially: print(open(filename).read())
    # *Substituting the var value for the var
    # This is getting complex
    # So then,
    # print function(argument for filename) then period (.) then read function (no argument) will do something??
