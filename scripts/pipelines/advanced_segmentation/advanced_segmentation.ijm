/*
 * A macro that runs a Labkit classifier over images, extract instance
 * segmentations and perform measurements on them.
 *
 * Images should have three channels:
 * - C1: nuclei (DAPI)
 * - C2: marker 1
 * - C3: marker 2
 *
 * License: BSD 3-Clause
 */
#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Ouput directory", style = "directory") output
#@ File (label = "pixel classifier", style = "file") classifier_path

function splitAndRenameChannels(file) {
    /*
     * Open an image and split its channels, then rename the new
     * images.
     *
     * Parameter
     * ---------
     * file:
     * 		Path to a file
     */

    // Open file
    open(file);

    // Split channels
    run("Split Channels");

    // List the open images
    list = getList("image.titles");

    // Names of the different channels
    NAMES = newArray("DAPI", "marker_1", "marker_2");

    // Loop over the images and rename the windows according to NAMES
    for (i = 0; i < list.length; i++) {

    	// Select the window
        selectWindow(list[i]);

        // Rename it
        rename(NAMES[i]);
    }
}

function measureROIs(marker_channel) {
    /*
     * Selects a window and perform measurements on each ROI
     * in the ROImanager.
     *
     * Parameter
     * ---------
     * marker_channel:
     * 		Name of the window on which to perform the measurements
     */

    // Select the correct window
    selectWindow(marker_channel);

    // Clear results and set the measurements to mean
    run("Clear Results");
    run("Set Measurements...", "mean redirect=None decimal=3");

    // For each ROI in the ROI manager, select a ROI and perform
    // a measurement
    for (i=0; i<roiManager("count"); i++) {
        roiManager("select", i);
        run("Measure");
    }
}

// Start by closing all windows
close("*");

// List files in the input folder
file_list = getFileList(input);

// Loop over each file
for (j=0; j<file_list.length; j++) {

	// Get file full path
    file_path = input + File.separator + file_list[j];

	// Split and rename the image
    splitAndRenameChannels(file_path);

    // Run the labkit classifier on the DAPI channel
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");

    // Remove small openings/connected components
    run("Area Opening", "pixel=50");

	// Create a selection from all the remaining segmented pixels
    run("Create Selection");

    // Split the selection into small ROIs
    roiManager("Split");

	// Measure the mean intensity on each ROI of marker 1
    measureROIs("marker_1");
    saveAs("Results", output + File.separator  + file_list[j] + "_marker_1_results.csv");

	// Same with marker 2
    measureROIs("marker_2");
    saveAs("Results", output + File.separator  + file_list[j] + "_marker_2_results.csv");

	// Save all ROIs
    roiManager("Save", output + File.separator  + file_list[j] + "_RoiSet.zip");

	// Close everything
	roiManager("Deselect");
	roiManager("Delete");
    close("*");
}
