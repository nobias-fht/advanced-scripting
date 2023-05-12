# Variables

The `ImageJ Macro` language is very friendly: there is no need to specify
what we want to store in a variable, we can just assign it a value.

```java title="Variables"
number = 42; // (1)!

// But a variable can also represent text (aka "string")
// (2)!
message = "This is also a variable";

// Verify the value of a variable by printing to the console
print(message);
```

1. Never forget the semi-colon ";"!
2. While we are here, this is how your add comments to your code!

Once you have defined a variable, you can simply do math with it.

```java title="Adding, multiplying variables"
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
```

??? info "What does `counter++` do?"
    That's right, it does exactly the same as `counter = counter + 1`

What happens when you use mathematical operations on strings?
