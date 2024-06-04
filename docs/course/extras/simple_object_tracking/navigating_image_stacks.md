---
tags:
  - pipeline
  - stacks
---
# Navigating Image Stacks

Image stacks are arrays of 2D images. In the folder `simple_tracking` you will
find a simple image stack from the
[cell tracking challenge](http://celltrackingchallenge.net/). We are going to
use this stack to make a simple manual tracking macro. :muscle:

To navigate through a stack, we use the following commands:

```javascript title="Stack navigation"
    run("Next Slice [>]");
    run("Previous Slice [<]");
```

Make a macro to try these commands out. :fire:

To find out which slice we are currently on, how many slices there are in total
in the stack, or to set the stack to a particular slice, we can use the
following commands:

```javascript title="Stack navigation"
    getSliceNumber();
    setSlice(n);
    nSlices;
```

??? question "Make a macro that prints the current slice and how many slices there are in the stack, and then moves the stack 10 slices ahead. Bonus: use string concatenation to make a nice, readable message"

    ```javascript
    print("We are currently at slice " + getSliceNumber() + " of " + nSlices + " total slices.");
    print("Moving to " + getSliceNumber + 10);
    setSlice(getSliceNumber + 10);
    ```

??? question "What would happen if we ran this macro on the last slice of the image stack? Try it and see. How could we fix this? (hint: remember the if/else logic from the introduction)"
    The script will crash, with the following error:
    `Argument must be >=1 and <=100 in line 2`. This is because we are asking
    the script to move to a slice that doesn't exist (in this case, slice 110). :scream:

    We can fix this by checking to see if 10 + the current slice number is less
    than the number of slices. If it is, we can move to that slice. Otherwise,
    we can move to the last slice. :ok_hand:

    ```javascript
    print("We are currently at slice " + getSliceNumber() + " of " + nSlices + " total slices.");

    if (getSliceNumber + 10 < nSlices) {
        print("Moving to " + getSliceNumber + 10);
        setSlice(getSliceNumber + 10);
    } else {
        print("Moving to " + nSlices);
        setSlice(nSlices);
    }
    ```

Right now we've made a macro that can move around a stack. That's not very
useful by itself. Let's extend this so that we can:

* Measure the XY position of the mouse :mouse:
* Make a box around the mouse position :dart:
* Measure the intensity of the pixels inside the box :collision:
