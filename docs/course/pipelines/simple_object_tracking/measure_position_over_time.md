#Manually tracking an object through stacks

Now that we have a macro to measure the xy position of the mouse cursor, we can make a simple manual tracking macro. It will record the xy position of an object that is under the mouse when the hotkey `g` is pressed, and advance to the next frame in the stack for the next measurement.

??? question "Using what you learned about stack naviation, modify the macro to advance one timepoint every time it is run"
    ```javascript
    macro "get_mouse_xy [g]" {
        getCursorLoc(x, y, z, modifiers)
        print(x,y)

        if (getSliceNumber + 1 < nSlices) { //(1)!
            setSlice(getSliceNumber + 1); 
        }
    }
    ```
    
    1. Why would we not use `run("Next Slice [>]");` here?


??? hint "Remember that when we change our macro, we need to re-install the new version!"
