# Here's some new strange stuff, remember type it exactly.

# Next two lines provide string values (including newlines) for vars days, months
days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"
monthsInd = "\nJan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"


# Next two lines print, first strings, then var values (is this the right way to say this? Print the 'values' of variables?)
print("Here are the days: ", days)
print("Here are the months: ", months)

# I want months to start on a new line, but I don't want the first one to be indented...
# How to do this? One way would be to add a newline before Jan in the variable value above
# The below still results in an indented 'Jan' at start of 'months output'
print("Here are the months:", "\n", months)

# Was I right about how it would work to add a newline in the variable value at top?
print("Here are the months:", monthsInd)
# It worked! Using the monthsInd var outputs months starting on a newline with no annoying space before 'Jan'
# So... What does that mean about the way that vars, print function, etc. work??

# The three double-quotes seem a way to print multi-line values (again, is 'values' the right word here?)
print("""
There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
""")
