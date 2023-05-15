# Loops

`Loops` are a way of telling the computer that we would like to perform an operation more than once. Let's take a look at how we write a loop in `ImageJ Macro`. It might seem complicated at first, but it's actually simple and powerful, and will be essential for `ImageJ Macro` programming.

Let's dive in!

### For Loops

```java title="For Loops"

for (i=0; i<10; i++) // (1)!
{
print(i);
}
```

1. Remember what the `++` operator does from the variables section?

The first line defines the loop and its parameters. First we have the keyword `for` which tells the computer we'd like to execute a specific type of loop called a "for loop".

Next, we have three arguments that tell the for loop what we would like to to. These are `i=0`, `i<10`, and `i++`, separated by semicolons `;`.

In this case, `i` is just a variable, like the ones we have seen before. It doesn't have to be `i`, you could call it anything you want, but `i` (for increment) is traditional in a for loop.

When this code is run, the first parameter `i=0` will set the initial value of `i` to 0. Then, we will check the second parameter `i<10` and ask "is i less than 10?". Because this is true, we will go on and execute whatever lines of code line within the curly braces `{}` (in this case, print the value of i). Then, the third parameter `i++`  will increment the value of `i` by 1.

We will then return to the top of the loop, except with the value of `i` set to '1' and repeat the exact same process. This will continue until we get to a condition where `i` is equal to 10. In this case, the check of the second parameter of the loop `i<10` will fail, and the loop will exit.

Try changing some of the values in the loop and see what happens.

??? question "How would we change the loop so that it ran 20 times"
    ```java title="For Loops"

    for (i=0; i<20; i++)
    {
    print(i);
    }
    ```

??? question "How could we count from 0 to 100, but in increments of 5?"
    ```java title="For Loops"
    for (i=0; i<101; i+=5)!
    {
    print(i);
    }
    ```

??? question "What would happen if we used the same macro, but instead incremented by -1 instead of 1"
    Because the second condition `i < 10` will always be true, we will have created an inifinite loop (a loop that will never terminate). If you happen to do this, no problem, you can always just close and reopen Fiji and all will be well. Infinite loops should be avoided, but even the best programmers sometimes accidentally make one.


### While loops

Another type of loop is the `while` loop. The general form is the following:

```java title="While Loops"

while (condition)
{
    //do something
}

```

This can be very useful to continue executing a block of code until a condition is met. For example, we could continue eroding a binary image until there are objects greated that 1000 pixels in size, for example.

A simpler example would be the following:

```java title="A simple while loop"

num = 10
while (num > 0)
{
print(num);
num--; // (1)!
}
```

1. This is the same as the num++ operator, just in reverse

Here, we are going to reduce the value of `num` by 1 until it reaches 0 by contnuing the loop until the `while (num > 0)` check fails.
