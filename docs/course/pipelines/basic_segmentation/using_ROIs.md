---
tags:
  - pipeline
  - rois
---
# Using ROIs in a script

Now that we have our segmentations, it's time to do some measurement! :triangular_ruler:

Let's measure the area covered by bax within the nuclei.

## Convert to ROI

First, we need to convert our thresholded image to an ROI. :thinking:

??? example "Add code to your macro to convert the thresholded bax image to a ROI. HINT: Look in the "Edit->Selection menu""

    ```javascript hl_lines="13 14 15 16"
    open("path/to/file/bax_DAPI_overlay.tif");
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
    selectWindow("nuclei_thresholded");
    run("Create Selection");
    selectWindow("bax_thresholded");
    run("Restore Selection");
    ```

## Measure area

There are many ways of estimating an are, but an easy one is to
measure the *integrated density* of the ROI of the thresholded bax image.

??? question "Look in the ImageJ documentation and find the definition of "Integrated Density". What does it do?"
    From the ImageJ documentation: "Integrated density The sum of the values of
    the pixels in the image or selection."

 In our case, this will be the number of pixels * pixel intensity. Since our
 pixels are either 0 or 255 in a thresholded image, integrated density / 255
 will give us the number of non-zero pixels in the ROI!

??? example "Add code to calculate the number of non-zero pixels, using integrated density. *Hint*: You will have to access the measured value in the results table. How could we do this?"

    ```javascript hl_lines="16 17 18 19 20"
    open("path/to/file/bax_DAPI_overlay.tif");
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
    selectWindow("nuclei_thresholded");
    run("Create Selection");
    selectWindow("bax_thresholded");
    run("Restore Selection");
    run("Set Measurements...", "area mean standard integrated redirect=None decimal=3");
    run("Measure");
    int_den_inside = getResult("IntDen", 0);
    print("the number of bax-positive pixels inside the nuclei is " + int_den_inside / 255);
    ```

From this, we can see that the number of bax-positive pixels (~area) is 12,984. :tada:

??? example "Use the same approach to calculate the area outside the nuclei. How could we measure everything EXCEPT what is in the nuclei? (there are at least three different ways of doing this!)"

    ```javascript hl_lines="21 22 23 24 25"
    open("path/to/file/bax_DAPI_overlay.tif");
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
    selectWindow("nuclei_thresholded");
    run("Create Selection");
    selectWindow("bax_thresholded");
    run("Restore Selection");
    run("Set Measurements...", "area mean standard integrated redirect=None decimal=3");
    run("Measure");
    int_den_inside = getResult("IntDen", 0);
    print("the number of bax-positive pixels inside the nuclei is " + int_den_inside / 255);
    run("Make Inverse");
    run("Measure");
    int_den_outside = getResult("IntDen", 1);
    print("the number of bax-positive pixels outside the nuclei is " + int_den_outside / 255);
    ```

!!! question
    BONUS: Convert the measurement from pixels to area (assume each pixel is 50nm square).

How about if we wanted not only the area, but the average intensity in each
region? :thinking:
