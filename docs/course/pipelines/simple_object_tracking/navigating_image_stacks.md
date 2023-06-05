#Navigating Image Stacks

Image stacks are arrays of 2D images. In the folder `xxx` you will find a simple image stack from the cell tracking challenge. We are going to use this stack to make a simple manual tracking macro.

To navigate through a stack, we use the following commands:

```javascript title="stack navigation"

    run("Next Slice [>]");
    run("Previous Slice [<]");
```

Make a macro to try these commands out.

To find out which slice we are currently on, how many slices there are in total in the stack, or to set the stack to a particular slice, we can use the following commands:

```javascript title="stack navigation"
    getSliceNumber();
    setSlice(n)
    nSlices
```

??? question "Make a macro that prints the current slice and how many slices there are in the stack, and then moves the stack 10 slices ahead. Bonus: use string concatenation to make a nice, readable message"
    ```javascript
    print("we are currently at slice " + getSliceNumber() + " of " + nSlices + " total slices. Moving to " + getSliceNumber + 10);
    setSlice(getSliceNumber + 10)
    ```

??? question "What would happen if we ran this macro on the last slice of the image stack? Try it and see. How could we fix this? (hint: remember the if/else logic from the introduction)"
    The script will crash, with the following error: `Argument must be >=1 and <=100 in line 2`. This is because we are asking the script to move to a slice that doesn't exist (in this case, slice 110). We can fix this by checking to see if 10 + the current slice number is less than the number of slices. If it is, we can move to that slice. Otherwise, we can move to the last slice.

    ```javascript
    print("we are currently at slice " + getSliceNumber() + " of " + nSlices + " total slices. Moving to " + getSliceNumber + 10);

    if (getSliceNumber + 10 < nSlices) {
        setSlice(getSliceNumber + 10);
        }
    else {
        setSlice(nSlices);
    }
    ```

Right now we've made a macro that can move around a stack. That's not very useful, by itself. Let's extend this so that we can
* measure the XY position of the mouse
* make a box around the mouse position
* measure the intensity of the pixels inside the box
