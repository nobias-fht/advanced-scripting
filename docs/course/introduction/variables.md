---
tags:
  - coding
  - variables
  - strings
  - print
---
# Variables

A variable is just a container that we can store a `value` in that has a
specific `name`. The name can be anything we want, and so can the value. The
`ImageJ Macro` language is very friendly: there is no need to specify what we
want to store in a variable, we can just assign it a value. :white_check_mark:

## First variables

!!!Note
        In the examples below, you can click on the `+` icon and see hints and tips.

Let's create some variables:

```javascript title="Variables"

// For example, we can store the value "42", under the name "number"
number = 42; // (1)!

// (2)!
// But a variable can also represent text (aka "string")
message = "This is also a variable";

// Verify the value of a variable by printing to the console
print(message);  // (3)!
```

1. :warning: Never forget the semi-colon `;`!
2. While we are here, `//` is how your add comments to your code! :party_popper:
3. You should remember this piece of code from the previous exercise. However,
instead of asking it to print "Hello World", we will be printing whatever is
stored in the variable `message`!

## Bad example

Keep in mind that the `name` and `value` of a variable do not have to match. We
could easily write the following code:

```javascript title="Bad Variable Names"

number = "Hello world";
dog = "Cat";
xyz_63193 = 42;

```

!!!Question
        Why might we not want to do this? :shrug:

## Changing a variable value

We can change the value assigned to a variable name by assigning a new `value`
to the same variable `name`:

```javascript title="Variables"

message = "This is a message";
print(message);
message = "This is a new message";
print(message);

```

!!!Question
        What happens when you run this code?

Once you have defined a variable, you can simply do math with it.

```javascript title="Adding, multiplying variables"
number = 15.6;

// Addition
number = number + 3;
print(number);

// Multiplication
new_number = number * 3;
print(new_number);

// Increment
counter = 0;
counter = counter + 1;
counter++;
print(counter);
```

??? question "What does `counter++` do?"
    That's right, it does exactly the same as `counter = counter + 1`
