#Measurements using the ROI manager

Now that we have our ROIs, we need to make the measurements. However these measurements are a little more complicated than just applying the ROI and making the measurement.

We need to do two things:

1) measure the area and average intensity of the bax signal inside the nucleus

2) measure the area and average intensity of the bax signal outside the nucleus

For these, we need to find the intersection of the nuclei and bax ROIs. Thankfully, the ROI manager give us an easy way to do this!

In the ROI manager, select the `nuclei` and `bax` ROIs. Under the "More>" menu, select the button for `AND`. This will give us the intersection of the two ROIs. You will notice now that only the bax signal that is inside the nucleus is highlighted. We are almost there! But, how to do this in a script?

??? question "Look at the macro recorder while we select two ROIs. What arguments are passed into the "Select" function?"
    ```javascript
    roiManager("Select", newArray(0,2));
    ```
    In this case, we pass in an `array` of the indices we would like to select (in this case, 0 and 2).


??? question "Add lines to your macro to select the `nuclei` and `bax` ROIs from the ROI manager, and perform the addition and measurement"
    ```javascript hl_lines="28 29 30 31"
    open("C:/Users/damian.dalle/OneDrive - Htechnopole/Desktop/course_test_data/bax_DAPI_overlay.tif");
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
    roiManager("Select", newArray(0,2));
    roiManager("AND");
    run("Measure");
    ```

Note that this will only perform the measurements selected in the "Set Measurements" window in ImageJ.

!!! tip "if you want to make sure that your script will perform certain measurements, you can set them from the script using `run("Set Measurements...", "area mean redirect=None decimal=3");`. It is often a good idea to add this to scripts"

??? question "Do the same for the `nuclei_inverted` and `bax` ROIs"
    ```javascript hl_lines="32 33 34 35"
    open("C:/Users/damian.dalle/OneDrive - Htechnopole/Desktop/course_test_data/bax_DAPI_overlay.tif");
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
    roiManager("Select", newArray(0,2));
    roiManager("AND");
    run("Measure");
    selectWindow("bax");
    roiManager("Select", newArray(1,2));
    roiManager("AND");
    run("Measure");
    ```

As a final step, let's save our images and our ROIs in the same place so we 

??? question "BONUS: We are selecting using numbers here, which makes our code harder to read. Is there a way we could use the names of the ROIs to make an array? HINT: Look at the documentation for the `RoiManager.getIndex(name)` function. See if you can incorporate it into your code"
     ```javascript hl_lines="32 33 34 35"
    open("C:/Users/damian.dalle/OneDrive - Htechnopole/Desktop/course_test_data/bax_DAPI_overlay.tif");
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
    roiManager("Select", newArray(RoiManager.getIndex("nuclei"),RoiManager.getIndex("bax")));
    roiManager("AND");
    run("Measure");
    selectWindow("bax");
    roiManager("Select", newArray(RoiManager.getIndex("nuclei_inverted"),RoiManager.getIndex("bax")));
    roiManager("AND");
    run("Measure");
    ```

