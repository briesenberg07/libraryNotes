from sys import argv
zero = input("Input the zero value:\n")
script, two, three, more = argv
print("Listen: I'm not outputting the first argument (the script name) because it isn't a freely-chooseable variable.\nHere's my understanding:\nWhen I use import argv it's going to import *all* of the command-line arguments, the first of which, naturally, is going to be the script I'm running to print things out.\nI'm experimenting with using command-line arguments as inputs (printing them out), in addition to keyboard input 'while the script is running' as in previous exercises, so I do want to practice getting some of the CL arguments to print\nBecause I know that I've got to have the script filename as my first argument, and because that makes it unlike the following arguments, which are just for fun and for practice getting them as inputs for the script, I'm leaving it out")
print("The two:", two)
print("The three:", three)
print("The more:", more)
print("The zero:", zero)
# My remaining question is whether import argv can be modified to import just *some* of the CL arguments...
