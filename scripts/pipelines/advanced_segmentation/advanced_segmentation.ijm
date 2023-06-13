/*
* A macro that runs a Labkit classifier over images, extract instance
* segmentations and perform measurements on them.
*
* License: BSD 3-Clause
*/
#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Ouput directory", style = "directory") output
#@ File (label = "pixel classifier", style = "file") classifier_path

file_list = getFileList(input);
number_of_files = file_list.length;

for (j=0; j<number_of_files; j++) {
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
    for (i=  1; i<=  max_value; i++) {
        labelToROI(i);
    }

    measureROIs("marker_1");
    saveAs("Results", output + File.separator  + file_list[j] + "_marker_1_results.csv");
    measureROIs("marker_2");
    saveAs("Results", output + File.separator  + file_list[j] + "_marker_2_results.csv");
    roiManager("Save", output + File.separator  + file_list[j] + "_RoiSet.zip");

    selectWindow("ROI Manager");
    run("Close");

    while (nImages>0) {
        selectImage(nImages);
        close();
    }
}
