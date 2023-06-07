---
tags:
  - pipeline
  - tracking
  - stacks
---
# Manually tracking an object through stacks

Now that we have a macro to measure the xy position of the mouse cursor, we can
make a simple manual tracking macro. It will record the xy position of an object
that is under the mouse when the hotkey `g` is pressed, and advance to the next
frame in the stack for the next measurement. :muscle:

??? question "Modify the previous macro to advance one timepoint every run"

    ```javascript hl_lines="5 6 7"
    macro "get_mouse_xy [g]" {
        getCursorLoc(x, y, z, modifiers);
        print(x,y);

        if (getSliceNumber + 1 < nSlices) {
            setSlice(getSliceNumber + 1); //(1)!
        }
    }
    ```

    1. Why wouldn't we use `run("Next Slice [>]");` here?

!!! hint
    Remember that when we we make change to our macro, we need to re-install
    the new version! :gear:
