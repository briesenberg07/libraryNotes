# this one is like your scripts with argv
def print_two(*args):
    # how could I say, "okay well however many args are entered will be the args, and they will be named with this convention"?
    arg1, arg2 = args
    # and then how could I say "well okay just print however many args were entered, and the string proceeding each arg will be formatted this way"?
    print(f"arg1: {arg1}, arg2: {arg2}")

# ok, that *args is actually pointless, we can just do this
def print_two_again(arg1, arg2):
    print(f"arg1: {arg1}, arg2: {arg2}")

# this just takes one argument
def print_one(arg1):
    print(f"arg1: {arg1}")

# this one takes no arguments
def print_none():
    print("I got nothin'.")

print_two("Ben","Riesenberg")
print_two_again("Ben","Riesenberg")
print_one("Different for the notes version!!")
print_none()
