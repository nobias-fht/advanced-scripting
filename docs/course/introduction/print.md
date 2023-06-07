---
tags:
  - coding
  - print
---
# First macro

A very simple program is often called "Hello World". Here all we are asking the
computer to do is print the phrase "Hello World". :waving_hand:

## Hello world

Open the ImageJ editor as described previously (`Plugins > New > Macro`).
In this window, type the following:

```javascript title=""

print("Hello World");

```

You should see a window titled `Log` appear with the words `Hello World`
printed in it. Congratulations, you've written your first computer program!
:party_popper:

It's worth taking a moment and understanding what is going on here.

First, we've told the computer  we would like to do (`print` something). This
is called a `function` and we will see many more of these as we progress through
the course.

Second, we've told the computer what we would like it to print (in this case the
string `Hello World`). This is called an `argument` and it gives the function a
specific piece of information that it needs.

Lastly, we want to tell the computer "OK, we're done giving you instructions,
you can go ahead and do what we told you to do". In the ImageJ macro language,
we do this by placing the `;` symbol at the end of the line. This is very
important, and in fact, if you forget to do this, your code will fail.

!!! note "Don't Panic!"
    Don't worry about typing the wrong thing and making an error. The worst
    case-scenario is that you will have to force your script to stop running.
    So don't be afraid of trying things and seeing what works (and what
    doesn't!). An important part of learning to program is learning from your
    mistakes! :thumbs_up:

## Calculator

We can also just use this window as a simple calculator. For example, we can
type mathematical operations, such as:

```java
print(10 + 3);
print(5 * 6);
print(90 / 9);
```

This can be very useful -- practice a few yourself.

Of course, we want to do more with our programs than printing out cute messages
and using it as a calculator. In the next section we will learn how we can
store and manipulate information using `variables`. :abacus:
