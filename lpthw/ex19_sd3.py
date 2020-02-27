from sys import argv
script, aw1, aw2 = argv

def word_meld(w1, w2):
    print("This function melds words together!")
    print(f"Prepare to see an entirely new word created from two inputs, '{w1}' and '{w2}'.")
    print(f"Here it is!\n{w2}{w1}")
    print("I hope you weren't too hung up on the order of the words you provided, man. Too bad.")
# Method 1: Integers
print("I wanna see first if this will work with integers.\nLet's call this 'number-word'.")
word_meld(5, 7)
print("I *think* I just printed '75'.")
print("\n")
# Method 2: argv
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
# Method 3: argv + input
print("Now let's combine what was given on the command line and what you'll give in input right here.")
print("I'll ask you for a couple of pieces of input, I1 and I2.")
I1 = input("I1: ")
I2 = input("I2: ")
UBER1 = aw1 + I1
UBER2 = aw2 + I2
# I tried to use double-quotations inside the parens below ('{I1}') and it messed up bringing in the var. Why??
print(f"""Now here's what I'm going to do:
I'm going to combine I1 ('{I1}'') with the second argument from the CL ('{aw1}')--let's call this UBER1.
Then I'll combine I2 ('{I2}') with the third argument from the CL ('{aw2}')--let's call this UBER2.
Lastly, I'll combine UBER1 ('{UBER1}') and UBER2 ('{UBER2}') to make a new word!
But not in the order you'd think! At any stage of the process!
""")
word_meld(UBER1, UBER2)
# Method 4: Number input, converted to integers, plus math!
print("Please input two numbers when prompted. Input only one or more characters 0-9--no spaces or other characters.")
n1 = int(input("First number: "))
n2 = int(input("Second number: "))
n1math = n1 + 1
n2math = n2 + 2
word_meld(n1math, n2math)
