tabby_cat = "\tI'm tabbed in."

# With persian_cat, the second-line portion has no indent, space character.
# My ongoing obsession with how the \n can (seems to me to) insert a space character into the output.
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

print(tabby_cat)
print(persian_cat)
print(backslash_cat)
print(fat_cat)

# Trying out various below.
# Carriage return is interesting--the '>' doesn't get output...
print("""
Okay now to try out some escape characters.
What the heck are these?
ASCII bell (BEL):
>\a<
ASCII formfeed (FF):
>\f<
ASCII linefeed (LF):
>\n<
Carriage return (CR):
>\r<
Horizontal tab (TAB):
>\t<
ASCII vertical tab (VT):
>\v<
""")

# Well I'll be dad-gummed! You really do use the 'name' of the character!
print("""
UNICODE!
\N{LATIN CAPITAL LETTER OI}
""")
print("""
UNICODE!
\N{YIN YANG}
""")
# Still don't understand exactly what a 'character named name in the Unicode database' is
# Also don't understand why, for some char names, my error message pointed to the closing """/''' instead of to the line with the character name!

# Study Drill no. 3:
# Combine escape sequences and format strings to create a more complex format
threeThings = "{} {} {}"
print(threeThings.format("\u1685", "\u1696", "\u1699"))

sail = "\u1684"
print(f"Ogham's a trip man. Like look at the character sail: {sail}")
