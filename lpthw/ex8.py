formatter = "{} {} {} {}"

# Q:
# What exactly do the periods ('.') do in the next five lines of code (excluding commments)?
# What are these called?
# I get that we have the print function, then 'formatter' tells the function what to print,
# then the 'format' function and its args tell what to replace the curly braces with...
print(formatter.format(1, 2, 3, 4))
print(formatter.format("one", "two", "three", "four"))
print(formatter.format(True, False, False, True))
# Okay I'll tell you right now that *this line of code is the most interesting one to me*
print(formatter.format(formatter, formatter, formatter, formatter))
print(formatter.format(
    "Try your",
    "Own text here",
    "Maybe a poem",
    "Or a song about fear"
))
# Here's my own text
# Note that I added '\n' to the end of the first three lines to get four strings on four lines,
# but this resulted in lines 2-4 being slightly indented (all indented the same, but
# line 1 was *not* indented. Don't understand this)
print(formatter.format(
    "Here's my text",
    "So see what's next",
    "The song you request",
    "Sung in jest"
))
