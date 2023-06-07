---
tags:
  - coding
  - gui
---
# User interaction exercises

!!!Question
    Create a new script/macro with the following skeleton of a macro:

    ```javascript title="Skeleton"
    #@ Type (label="Label") name
    #@output String myString

    myString = ;

    ```

    Then, follow these steps:

    1. Go to the [parameters documentation](https://imagej.net/scripting/parameters#parameter-types).
    2. Choose a `Type` and a `Style` if applicable.
    3. In the macro, add the `Type` to the parameter declaration.
    4. If you have a `Style`, add `style="..."` with the appropriate value in the
        parenthesis.
    5. Give a `name` to your parameter and change the `label`.
    6. Use the value of the parameter to make a string.
    7. Run your macro! :rocket:

!!!Question
    Find examples, of the `Type` you chose, in the documentation and explore the
    different parameters.

    For instance, an `Integer` type has different styles and parameters (e.g.
    min, max etc.).

!!!Question
    Find an example of a dialog to choose a file and use it in a macro.

How freakin' amazing is that? :exploding_head:
