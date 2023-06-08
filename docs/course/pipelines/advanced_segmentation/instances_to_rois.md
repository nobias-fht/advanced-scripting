#Converting intstances to ROIs

Unfortunately, there isn't a very easy way to convert these instances into ROIs without using a plugin. This is a situation where you're probably better off using a programming language that isn't Fiji macro (cough, :snake:, cough). However, we can work around this limitation.

One thing we could do since each nucleus is now labelled with a different intensity value is threshold our images, starting with the first label (isolating that cell), converting this to an ROI, adding it to the ROI manager, and then repeating for the second label and so on.

Sounds incredibly tedious, doesn't it?

Well that's why we have automation. Let's do it!

??? question "Add to the end of your script code to duplicate the segmented image, threshold the first label (with a value of 1), convert this area to a masl and add it to the ROI manager (don't forget to close this thresholded image since we won't need it anymore). Hint: The code to set the threshold is `setThreshold(min_value, max_value);`"
    ```javascript hl_lines="7 8 9 10 11 12 13"
    splitAndRenameChannels("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif");
    classifier_path = "C:\\local_course\\nuclei_classifier.classifier";
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");
    run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
    run("Duplicate...", " ");
    setThreshold(1, 1);
    run("Convert to Mask");
    run("Create Selection");
    roiManager("Add");
    run("Close"); 
    ```

Now we need to repeat this for each label in the image. You should at this point be thinking "loops!". But, also, since we have a block of code that does a self-contained operation, you should also be thinking "functions!".

??? question "Convert the code to duplicate, threshold and add the ROI to the manager into a function. What should the argument to this function be? Hint: What is changing?"
    ```javascript
    function labelToROI(label) {
        run("Duplicate...", " ");
        setThreshold(label, label);
        run("Convert to Mask");
        run("Create Selection");
        roiManager("Add");
        run("Close");
        }

    splitAndRenameChannels("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif");
    classifier_path = "C:\\local_course\\nuclei_classifier.classifier";
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");
    run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
    labelToROI(1);
    ```

Finally, we need to wrap the `labelToROI()` in a for loop, to loop through all of the available labels. How could find out when to terminate the loop (ie when the maximum label value is reached)?

??? question "Make a for loop that loops through the label values, passing the iterator into the `labelToROI()` function"
    ```javascript
    classifier_path = "C:\\local_course\\nuclei_classifier.classifier";
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");
    run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
    run("Set Measurements...", "min redirect=None decimal=3");
    max_value = getResults("Max"); //(1)!
    for (i=1; i<=max_value; i++) {
        labelToROI(i);
    }
    ```

    1. If you do not pass in the second, optional, "row" argument to this function, it defaults to the most recently added row. Handy!


Now we have our ROIs, let's do some measurements!



    