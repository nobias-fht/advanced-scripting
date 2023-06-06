---
tags:
  - coding
  - functions
---
# Functions

Macros can become very long... And we all have a tendency of reusing code by
pasting it across the script. :sweat_smile:

One way to avoid code duplication is to place them into a function. A function
is a block of code that can be called from anywhere in the script. :muscle:

For instance in this snippet, there are some duplications:

```javascript title="Macro with duplications"
array1 = newArray(5);

for (i = 0; i < array1.length; i++) {
 array1[i] = (i * array1.length / 90) * (PI / 180);
}
Array.print(array1);


array2 = newArray(10);
for (i = 0; i < array2.length; i++) {
 array2[i] = (i * array2.length / 90) * (PI / 180);
}
Array.print(array2);
```

Pretty cumbersome, isn't it? :sweat_smile:

A function can be used to avoid this duplication:

```javascript title="Macro with function"
function fillArray(size) { // (1)!
    // (2)!
    array = newArray(size);

    for (i = 0; i < size; i++) {
        array[i] = (i * size / 90) * (PI / 180);
    }

    Array.print(array);

    return array // (3)!
}

array1 = fillArray(5); // (4)!
array2 = fillArray(10);
```

1. Function declaration
2. Function body
3. Return statement
4. Function call

Pretty neat! :sunglasses:

## Function declaration

A function is declared using the `function` keyword followed by the function
name and a list of parameters between parentheses. The function body is
enclosed between curly brackets.

```javascript title="Function declaration"
function functionName(parameter1, parameter2, ...) {
    // Function body
    return returnValue; // (1)!
}
```

1. The return is optional! :scream:

## When to use functions?

Whenever you are going to use the same lines of code more than once, you should
consider using a function. :muscle:

You can declare multiple functions in the same script. What is important is to
keep the code clean. Smaller functions are easier to test and to debug, as you
can call them with different parameter values and check the output. :sunglasses:

!!!Note
    Modifying existing code to make it more readable is called **refactoring**.
    It includes:

    - Moving code to functions to avoid duplications
    - Renaming variables and functions to make their purpose clearer
    - Splitting long functions into smaller ones
    - Replacing numbers by variables
    - Documenting the code (see next section)
