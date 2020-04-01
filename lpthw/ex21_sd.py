def add(a, b):
    print(f"ADDING {a} + {b}")
    return a + b

def subtract(a, b):
    print(f"SUBTRACTING {a} - {b}")
    return a - b

def multiply(a, b):
    print(f"MULTIPLYING {a} * {b}")
    return a * b

def divide(a, b):
    print(f"DIVIDING {a} / {b}")
    return a / b

A = int(input("Input var A: "))
B = int(input("Input var B: "))
C = int(input("Input var C: "))

print(f"Okay let's try a little formula: (A+B)/C.")

result = divide(add(A, B), C)
print(result)

# Holy crap it worked!
    # I had to go back and convert my inputs into type integers
