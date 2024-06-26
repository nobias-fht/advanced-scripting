---
tags:
  - exercise
  - arrays
---
# String exercises

!!! question
    Previously, we saw that we could `split` the variable
    `string = "myfile.tif"` at the `.` character.

    What would the output be if we changed the code to split the string at the
    character `i` instead of the `.`?

!!! question
    There are tons of useful functions to manipulate strings. Can you tell what
    the following functions do?

    ```javascript title="Useful string functions"
    my_string = "This is a very long string with a lot of information in there";

    my_string.length;
    my_string.contains("is");

    substring(my_string, 10, 26);
    indexOf(my_string, "lot of information");
    startsWith(my_string, "This");
    endsWith(my_string, "that.");
    toLowerCase(my_string);
    toUpperCase(my_string);
    ```

    Play with them and picture what they can be useful for. :thinking:

??? question "In the above section, Why do some of the operations return `0` or `1`?"
    Answer: In computer programming, a value of `1` is often used to signify `True` and
    a value of `0` to signify `False`. In these cases, the computer is just
    telling us whether the question we asked it is `True` or `False`.

!!! question
    Write code to remove the numeric value from the string
    `my_new_8463_file.tif`.

    Can you do it without hard-coding the number `8463` and its position
    in the string?

    *Hint*: the final value should look like `my_new_file.tif`, you can split the
    strings as previously shown and join them together using the `+` operator.
