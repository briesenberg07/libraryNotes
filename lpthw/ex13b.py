from sys import argv
one, two, three = argv
print("The one (which you must enter--how to make it otherwise? Will it work as 'one' and not 'script'?):", one)
print("The two:", two)
print("The three:", three)
# Okay here's what I don't get about this:
# var 'one' is doing double duty right!?
# Because it must be entered so that the printing will happen as we've defined *in it*
# But it is *also* the value of the first variable, and gets printed as such
# Thus, 'double-duty,' as I'm calling it
# How to run the script, but separate the input of the script name as an argument from the input of
    # three variables for printing??
