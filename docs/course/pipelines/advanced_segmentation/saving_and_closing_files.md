#Saving and Closing Files

Let's take a look at our code and see how things are being saved. Right now we're only saving the output of the measurements. We would also like to save the ROIs that we used to generate, and the segmentation that we used to generate those.

??? question "using the output folder we defined, and the file name (from file_list[index]), save the segmentation results, and the ROIs"
    ``` javascript

    #@ File (label = "Input directory", style = "directory") input
    #@ File (label = "Ouput directory", style = "directory") output
    #@ File (label = "pixel classifier", style = "file") classifier_path


    file_list = getFileList(input);
    number_of_files = file_list.length;

    for (j=0; j<number_of_files; j++) //(1)!
        {
        file_path = input + File.separator + file_list[j];
        splitAndRenameChannels(file_path);
        selectWindow("DAPI");
        run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
        run("Area Opening", "pixel=50");
        run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
        saveAs("Tiff", output + File.separator + file_list[j] + "_segmentation");

        run("Set Measurements...", "min redirect=None decimal=3");
        run("Measure");
        max_value = getResult("Max"); 
        for (i=1; i<=max_value; i++) {
            labelToROI(i);
        }
        measureROIs("marker_1");
        saveAs("Results", output + File.separator  + file_list[j] + "_marker_1_results.csv");
        measureROIs("marker_2");
        saveAs("Results", output + File.separator  + file_list[j] + "_marker_2_results.csv");
        roiManager("Save", output + File.separator  + file_list[j] + "_RoiSet.zip");
        }
    ```

The last thing we need to do is close all the files we have open (and the ROI manager), so that we're ready to load the next image in the subsequent loop.

??? question "Closing all open file is a little tricky! See if you can find some code online and add it to the end of your macro. Also add a line to close the ROI manager"
    ```javascript
    #@ File (label = "Input directory", style = "directory") input
    #@ File (label = "Ouput directory", style = "directory") output
    #@ File (label = "pixel classifier", style = "file") classifier_path


    file_list = getFileList(input);
    number_of_files = file_list.length;

    for (j=0; j<number_of_files; j++) //(1)!
        {
        file_path = input + File.separator + file_list[j];
        splitAndRenameChannels(file_path);
        selectWindow("DAPI");
        run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
        run("Area Opening", "pixel=50");
        run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
        saveAs("Tiff", output + File.separator + file_list[j] + "_segmentation");

        run("Set Measurements...", "min redirect=None decimal=3");
        run("Measure");
        max_value = getResult("Max"); 
        for (i=1; i<=max_value; i++) {
            labelToROI(i);
        }
        measureROIs("marker_1");
        saveAs("Results", output + File.separator  + file_list[j] + "_marker_1_results.csv");
        measureROIs("marker_2");
        saveAs("Results", output + File.separator  + file_list[j] + "_marker_2_results.csv");
        roiManager("Save", output + File.separator  + file_list[j] + "_RoiSet.zip");

        selectWindow("ROI Manager");
        run("Close");

        while (nImages>0) { //(1)!
                selectImage(nImages); 
                close(); 
            }    
    }
    ```

    1. See if you can think though this loop and understand what it is doing.

    We've finished our macro! :fireworks:

    There are certainly more things that we could add and clean up, but the core functionality is there and things appear to work.
    If you are done early, you could consider the following exercises:

    * Right now the files are saved as something like `siCntrl_1.tif_segmentation.tif`. The .tif in the middle is there because we used the oringinal file name as part of the string to create the new file name. Blech :vomit:. See if you can clean this up.


