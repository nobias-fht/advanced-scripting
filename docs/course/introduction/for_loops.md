---
tags:
  - coding
  - loops
---
# For loops

`Loops` are a way of telling the computer that we would like to perform an
operation more than once. Let's take a look at how we write a loop in
`ImageJ Macro`. It might seem complicated at first, but it's actually simple and
powerful, and will be essential for `ImageJ Macro` programming. So much of automated image analysis is telling the computer "Repeat this tedious task 500 times so that I don't have to" :fire:

Let's dive in! :diving_mask:

```java title="For Loops"

for (i=0; i<10; i++){ // (1)!
    print(i);
}
```

1. Remember what the `++` operator does from the variables section?

The first line defines the loop and its parameters. First we have the keyword
`for` which tells the computer we'd like to execute a specific type of loop
called a "for loop".

Next, we have three arguments that tell the for loop what we would like to to.
These are `i=0`, `i<10`, and `i++`, separated by semicolons `;`.

In this case, `i` is just a variable, like the ones we have seen before. It
doesn't have to be `i`, you could call it anything you want, but `i` (for
increment) is traditional in a for loop.

When this code is run, the first parameter `i=0` will set the initial value of
`i` to 0. Then, we will check the second parameter `i<10` and ask "is i less
than 10?". Because this is true, we will go on and execute whatever lines of
code line within the curly braces `{}` (in this case, print the value of i).
Then, the third parameter `i++`  will increment the value of `i` by 1.

We will then return to the top of the loop, except with the value of `i` set to
`1` and repeat the exact same process. This will continue until we get to a
condition where `i` is equal to 10. In this case, the check of the second
parameter of the loop `i<10` will fail, and the loop will exit.

Try changing some of the values in the loop and see what happens. :rocket:
