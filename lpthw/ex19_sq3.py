from sys import argv
script, aw1, aw2 = argv

def word_meld(w1, w2):
    print("This function melds words together!")
    print(f"Prepare to see an entirely new word, made from the words you provided, namely '{w1}' and '{w2}'.")
    print(f"Here it is!\n{w2}{w1}")
    print("I hope you weren't too hung up on the order of the words you provided, man. Too bad.")

print("I wanna see first if this will work with integers.\nLet's call this 'number-word'.")
word_meld(5, 7)
print("I *think* I just printed '75'.")
print("\n")

print("Now we try it using 'argv'.")
# *if* I used w1 and w2 for argv second and third values above and in script below...
# ...there wouldn't be any conflict between w1 and w2 from the CLI and w1 and w2 in the function definition.
# as mentioned in the book, the vars in the script are separate from the vars in functions.
# BUT it's bad to have global vars with the same names as function vars!
word_meld(aw1, aw2)
# note to self that *it seems like* each line-break in the multiline printstring outputs a newline to standard output (?)
print(f"""
The new word created should have been made up of:
First, the third argument you entered on the command line. That is, '{aw2}'.
Second, the second argument you entered on the command line. That is, '{aw1}'.
Note that the first thing you entered in the command line prompt, that is, the script name '{script}', wasn't used as part of the new word.
""")
