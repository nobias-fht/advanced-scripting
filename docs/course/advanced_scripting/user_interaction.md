---
tags:
  - coding
  - gui
---
# User interaction

A macro is nice, but many errors come from hard-coding values or paths in the
script. You forgot to change one parameter? Well, everything crashed and you
are looking at 1h of debugging. :sob:

To make macros and scripts friendlier, the ImageJ2 team came up with `script
parameters`. These **automatically**
generate a graphical user interface (GUI)! :exploding_head:

## Simple script parameter

Here is a simple example to place at the start of a script:

```javascript title="Simple example"
#@ String (label="Please enter your name", description="Name") name // (1)!
#@output String greeting // (2)!

greeting = "Hello, " + name + "!" // (3)!
```

1. This is the parameter declaration, it has a type (`String`) and a name.
2. Output declaration, necessary if you want to print something to the user or
    show an image.
3. The script itself. The `name` variable is automatically filled by the GUI.

Try it! :fire:

The first thing to notice is that the name is never hard-coded in the script! :tada:

!!! Note
    There are many types of parameters. For more info, check out the
    [parameters documentation](https://imagej.net/scripting/parameters).

!!! Note
    Have you noticed that the `greeting` was prompted to a different window
    than usually?

    This is because the `parameters` are a feature of `scripts` in ImageJ2.
    The `print` function of the macros is an old feature belonging to ImageJ1.
