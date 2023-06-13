/*
* A macro that performs basic segmentation using thresholding.
*
* License: BSD 3-Clause
*/
#@ File (label = "Input file", style = "file") input_file

// Close everything and clear ROIs
if (roiManager("count") > 0){
	roiManager("deselect");
	roiManager("delete");
}
run("Clear Results");
close("*");

function measureIntersect(roi_1, roi_2) {
    /*
     * Select two rois, get their intersection and perform a measurement.
     *
     * Parameters
     * ----------
     * roi_1:
     *      First roi name
     * roi_2:
     *      Second roi name
     */
    // Create an array with the two rois
    rois = newArray(RoiManager.getIndex(roi_1), RoiManager.getIndex(roi_2));

    // Select them
    roiManager("Select", rois);

    // Get their intersection
    roiManager("AND");

    // Run measurement
    run("Measure");
}

function threshold(name){
    /*
     * Duplicate and threshold an image.
     *
     * Parameters
     * ----------
     * name:
     *      Image name
     */

     // Select image
     selectWindow(name);

     // Duplicate
     run("Duplicate...", "title="+name+"_thresholded");

     // Default thresholding
     run("Auto Threshold", "method=Default white");
}

// Constants
BAX = "bax";
NUC = "nuclei";

// Open file
open(input_file);
file_name_array = split(input_file, File.separator);
file_name = file_name_array[file_name_array.length-1];

// Split channel
run("Split Channels");

// Rename channels
selectWindow("C1-"+file_name);
rename(NUC);

selectWindow("C2-"+file_name);
rename(BAX);

// Threshold channels
threshold(BAX);
threshold(NUC);

// Create ROI from the thresholded nuclei
selectWindow(NUC+"_thresholded");
run("Create Selection");
roiManager("Add");

// Create background ROI
run("Make Inverse");
roiManager("Add");

// Create BAX roi
selectWindow(BAX+"_thresholded");
run("Create Selection");
roiManager("Add");

// Rename ROIs
INUC = NUC+"_inverted";
name_array = newArray(NUC, INUC, BAX);
for (i=0; i<roiManager("count"); i++) {
    roiManager("Select", i);
    roiManager("rename", name_array[i]);
}


selectWindow(BAX);
measureIntersect(NUC, BAX);
measureIntersect(INUC, BAX);
