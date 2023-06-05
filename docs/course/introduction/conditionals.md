# Conditionals

Conditional statements are at the core of computer programming. They are how we tell the computer when we would like a particular block of code executed. Without them, the same code would run every time in the exact same order, and that wouldn't be very interesting.

The most common type of conditional operator is the `if/else` operator. Simply, this operator checks `if` something is true, and then does something if it is, and something `else` if it is not true. Let's see an example:

```java title="If Else statements"

    number = 42

    if (number < 50)
    {
        print("The number is less than 50");
    }
    else
    {
        print("The number is not less than 50");
    }

```

Take note of the form of this comparison. We start with the keyword `if`, and then follow with a comparison in parentheses, in this case `(number < 50)`. Then we have the block of code to execute if this is true with `{}`. This is followed by the keyword `else`, and another block of code to execute if the comparison is false, again between `{}`.

Generally speaking the if/else conditional block looks like this:

```java title="If Else statements"
    if (comparison)
    {
        //code to execute if comparison is true
    }
    else
    {
        //code to execute if comparison is false
    }

```


??? question "Write a block of code that prints "The number is equal to five" if the variable `num` is equal to five, or "The number is not equal to five" if it is not."
     ```java
    if (num == 5)
    {
        print("The number is equal to 5");
    }
    else
    {
        print("The number is not equal to five");
    }

    ```

??? question "Write a block of code that prints "The number is divisible by 10" if the variable `num` is divisible by 10, or "The number is not divisible by 10" if it is not. (hint, you should use the 'remainder' operator `%`. Can you work out what it does? Try a few math commands)"
     ```java
    if (num % 10 == 0)
    {
        print("The number is divisible by 10");
    }
    else
    {
        print("The number is not divisible by 10");
    }

    ```

1. test





- if else
- comparison operators
- negation
