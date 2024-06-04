---
tags:
  - pipeline
  - mouse
---
# Getting mouse position

To get the position of the mouse, we use the following syntax:

```javascript
getCursorLoc(x, y, z, modifiers);
```

This will store the current mouse position (in pixel units) in the variables
`x`, `y` and `z` (where z is the stack position, and is 0 for a 2-dimensional
image). :mouse:

We can then print the `x` and `y` coordinates of the mouse:

```javascript
print(x, y);
```

How can we run this macro while the mouse is over the image? :thinking:

We can install our macro and assign it to a keybinding! The way we do this is by
wrapping the entire macro in the following syntax:

```javascript
macro "my_macro [g]" {
    //macro contents
}
```

In this case, we have given the macro the name `my_macro`, and assigned it to
the key `g` (using the `[g]` syntax). :exploding_head:

??? example "Write a macro that prints the x and y coordinates of the mouse when you press `g`"

    ```javascript
    macro "get_mouse_xy [g]" {
        getCursorLoc(x, y, z, modifiers);
        print(x,y);
    }
    ```

In order to use our macro, we have to install it. We do this by saving the macro
somewhere on our computer, and then using the command `Plugins > Macro > Install`
from the menu.

Once we have selected our macro file, we should see it appear in the
`Plugins > Macro` menu. Try running this macro a few times on your image. :gear:
