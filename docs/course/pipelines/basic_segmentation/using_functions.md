---
tags:
  - pipeline
  - functions
---
# Writing clean code with functions

In our macro, you can see that we have repeated lines of code. A fundamental
paradigm of programming is DRY: Don't repeat yourself. :warning:

Code that does not contain a lot of repeated lines is called "dry". Code that
repeats a lot of lines is called "wet", and right now, our code is looking
pretty wet.

But we can fix this by writing functions to do some of this processing that we
know is going to happen on every image. :wrench:

For example, the code to select arrays from the ROI manager, make the
intersection, and peform the measurement is repeat twice, with the only
difference being which indicies we select.

??? example "Write a function that performs this job, and replace your code with calls to this function"

    ```javascript hl_lines="1 2 3 4 5 35 36 37"
    function measureIntersect(roi_1, roi_2) {
        roiManager("Select", indexArray(RoiManager.getIndex(roi_1),RoiManager.getIndex(roi_2)));
        roiManager("AND");
        run("Measure");
    }

    open("path/to/data/bax_DAPI_overlay.tif");
    run("Split Channels");
    selectWindow("C1-bax_DAPI_overlay.tif");
    rename("nuclei");
    selectWindow("C2-bax_DAPI_overlay.tif");
    rename("bax");
    selectWindow("nuclei");
    run("Duplicate...", "title=nuclei_thresholded");
    run("Auto Threshold", "method=Default white");
    selectWindow("bax");
    run("Duplicate...", "title=bax_thresholded");
    run("Auto Threshold", "method=Default white");
    selectWindow('nuclei_thresholded');
    run("Create Selection");
    roiManager("Add");
    run("Make Inverse");
    roiManager("Add");
    selectWindow('bax_thresholded');
    run("Create Selection");
    roiManager("Add");

    name_array = newArray("nuclei", "nuclei_inverted", "bax")
    for (i=0; i<roiManager("count"); i++) {
        roiManager("Select", i);
        roiManager("rename", name_array[i]);
    }

    selectWindow("bax");
    measureIntersect("nuclei", "bax");
   measureIntersect("nuclei_inverted", "bax");

    ```

Now, the last three lines of our script look much easier to understand! :tada:

!!! question
    Can you see anywhere else where we repeat code that could otherside be a
    function?
