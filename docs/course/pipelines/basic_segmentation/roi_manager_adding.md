---
tags:
  - pipeline
  - measurements
  - rois
---
# Measuring Intensity and using ROI manager

We can use our ROIs to measure not just the integrated density, but the
average intensity of the bax signal. :fire:

To do this, however, we need to measure the average intensity of the signal in
the ROI defined by the bax segmentation only, not the nuclei. How could we do
this? :thinking:

Let's do this a slightly different way, and clean up our code a little bit at
the same time, using the ROI manager. :rocket:

The ROI manager has a lot of useful macro commands attached to it, which can be
found in the "built in macro functions" section of the
[ImageJ docs](https://wsr.imagej.net/developer/macro/functions.html). Let's
delete all of the code highlighted below from our macro. Dont worry! We're going
to replace it with something better. Deleting old code and re-writing it in a
better way is a key part of software development.

```javascript hl_lines="14 15 16 17 18 19 20 21 22 23"
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

??? example "From the docs, find out how to add the ROIs to the manager in your script, and (importantly!) how to rename them. Modify your macro so that you add the ROIs. Also add the inverse of the nuclei ROI."

    ```javascript hl_lines="15 16 17 18 19 20"
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
    roiManager("Add");
    run("Make Inverse");
    roiManager("Add");
    selectWindow("bax_thresholded");
    run("Create Selection");
    roiManager("Add");
    ```

While we're here, let's add code to add the inverse of the nuclei image! :rocket:
