#Measuring ROIs

We've seen before how to measure ROIs, so nothing here should be particularly new. We should measure the corresponding areas in each of the two channels. 


??? loop through the ROI manager (remember how to select ROIs from the manager?) and measure the intesities of each of the two channels, then save the results table as the file name + 'channel_number_results'."
    ```javascript
    splitAndRenameChannels("path/to/test/file")
    classifier_path = "path/to/classifier";
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");
    run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
    run("Set Measurements...", "min redirect=None decimal=3");
    run("Measure");
    max_value = getResult("Max");
    for (i=1; i<=max_value; i++) {
        labelToROI(i);
    }

    selectWindow('marker_1');
    run("Clear Results"); //clear the results table first!
    run("Set Measurements...", "mean redirect=None decimal=3"); //remember to set the measurements
    for (i=0; i<roiManager("count"); i++) {
        roiManager("select", i);
        run("Measure");
    }

    selectWindow('marker_2');
    run("Clear Results"); //clear the results table first!
    run("Set Measurements...", "mean redirect=None decimal=3"); //remember to set the measurements
    for (i=0; i<roiManager("count"); i++) {
        roiManager("select", i);
        run("Measure");
    }

    ```
    
!!! tip "We could have avoided writing this loop, because the ROI manager will automatically measure all of the ROIs if nothing is selected. We could have instead have written `roiManager("Deselect");` and then `roiManager("Measure");`. But aren't you glad you got the extra practice writing loops?"


??? question "Hmmmmm we have repeated code. You know what do to..."
    ```javascript
    function measureROIs(marker_channel) {
        selectWindow(marker_channel);
        run("Clear Results"); 
        run("Set Measurements...", "mean redirect=None decimal=3");
        for (i=0; i<roiManager("count"); i++) {
            roiManager("select", i);
            run("Measure");
        }
    }

    splitAndRenameChannels("path/to/test/file");
    classifier_path = "path/to/classifier";
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");
    run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
    run("Set Measurements...", "min redirect=None decimal=3");
    run("Measure");
    max_value = getResult("Max"); 
    for (i=1; i<=max_value; i++) {
        labelToROI(i);
    }
    measureROIs("marker_1");
    saveAs("Results", "C:/local_course/marker1_results.csv");
    measureROIs("marker_2")
    saveAs("Results", "C:/local_course/marker2_results.csv");
    ```

Right now these are saving the results as `marker1_results_1.csv` and `marker_2_results_2.csv`. This is fine for now, but won't do once we loop through other files since they all need to have a name that tells us which file they are from.

In the next section we will implement code to loop through all the images, save the results files to the right places, and save all our ROIs and images.


   