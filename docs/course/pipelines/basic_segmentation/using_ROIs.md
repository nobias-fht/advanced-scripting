#Using ROIs in a script

Now that we have our segmentations, it's time to do some measurement!

Let's measure the area covered by bax within the nuclei.

First, we need to convert our thresholded image to an ROI. 

??? question "Add code to your macro to convert the thresholded image to an ROI and apply that to the thresholded bax image. HINT: Look in the "Edit->Selection menu""
    ```javascript hl_lines="13 14 15 16"
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
    selectWindow("bax_thresholded");
    run("Restore Selection");
    ```

There are many ways of doing this, but an easy one is to measure the integrated density of the ROI of the thresholded bax image.



??? question "Look in the ImageJ documentation and find the definition of "Integrated Density". What does it do?"
    From the ImageJ documentation: "Integrated density The sum of the values of the pixels in the image or selection."




 In our case, this will be the number of pixels * pixel intensitry. Since our pixels are either 0 or 255 in a thresholded image, integrated density / 255 will give us the number of non-zero pixels in the ROI!

??? question "Add code to your script that will calculate the number of non-zero pixels, using integrated density. HINT: You will have to access the measured value in the results table. How could we do this?"
    ```javascript hl_lines="17 18 19"
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
    selectWindow("bax_thresholded");
    run("Restore Selection");
    run("Measure");
    getResult("IntDen", 0);
    print("the number of bax-positive pixels inside the nuclei is " + int_den / 255); 
    ```

From this, we can see that the number of bax-positive pixels (~area) is 12,984

??? question "Use the same approach to calculate the area outside the nuclei. How could we measure everything EXCEPT what is in the nuclei? (there are at least three different ways of doing this!)"
    ```javascript hl_lines="20 21 22 23"
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
    selectWindow("bax_thresholded");
    run("Restore Selection");
    run("Measure");
    int_den_inside = getResult("IntDen", 0);
    print("the number of bax-positive pixels inside the nuclei is " + int_den_inside / 255); 
    run("Make Inverse");
    run("Measure");
    int_den_outside = getResult("IntDen", 1);
    print("the number of bax-positive pixels outside the nuclei is " + int_den_outside / 255); 
    ```

??? question "BONUS: Convert the pixels to area (assume each pixel is 50nm square)"


How about if we wanted not only the area, but the average intensity in each region?




    