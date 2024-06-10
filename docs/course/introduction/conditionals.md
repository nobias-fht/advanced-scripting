---
tags:
  - coding
  - conditionals
  - if
---
# Conditionals

Conditional statements are at the core of computer programming. They are how we
tell the computer when we would like a particular block of code executed.
Without them, the same code would run every time in the exact same order, and
that wouldn't be very interesting. :shrug:

The most common type of conditional operator is the `if/else` operator. Simply,
this operator checks `if` something is true, and then does something if it is,
and something `else` if it is not true. Let's see an example:

```javascript title="if-else statements"
number = 42;

if (number < 50) {
    print("The number is less than 50");
} else if (number == 50){
    print("The number is equal to 50");
} else {
    print("The number is greater than 50");
}
```

Take note of the form of this comparison. We start with the keyword `if`, and
then follow with a comparison in parentheses, in this case `(number < 50)`. Then
we have the block of code to execute if this is true with `{}`. This is followed
by the keyword `else`, and another block of code to execute if the comparison is
false, again between `{}`. :fire:

!!!Warning
    The `else if` and `else` statements are optional. You can have as many
    `else if` statements as you want. However, you can only have one `else` and
    one `if` statement.

## Comparison operators

There are a number of comparison operators that we can use in conditional
statements:

```javascript title="Comparison operators"
number = 42;
//smaller_than
number < 50;

//smaller_or_equal
number <= 50;

//greater_than
number > 50;

//greater_or_equal
number >= 50;

//equal
number == 50;

//not_equal
number != 50;
```

These operators are empowering as they allow fine control when used with an
`if-else` statement.
