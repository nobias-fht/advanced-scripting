/*
* A macro that runs a Labkit classifier over images, extract instance
* segmentations and perform measurements on them.
*
* License: BSD 3-Clause
*/
#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Ouput directory", style = "directory") output
#@ File (label = "pixel classifier", style = "file") classifier_path

function splitAndRenameChannels(file) {
    /*
     *
     *
     */
    open(file);
    run("Split Channels");
    list = getList("image.titles");
    names = newArray("DAPI", "marker_1", "marker_2");
    for (i = 0; i < list.length; i++) {
        selectWindow(list[i]);
        rename(names[i]);
    }
}

function measureROIs(marker_channel) {
    /*
     *
     *
     */
    selectWindow(marker_channel);
    run("Clear Results");
    run("Set Measurements...", "mean redirect=None decimal=3");
    for (i=0; i<roiManager("count"); i++) {
        roiManager("select", i);
        run("Measure");
    }
}

close("*");

file_list = getFileList(input);
number_of_files = file_list.length;

for (j=0; j<number_of_files; j++) {
    file_path = input + File.separator + file_list[j];

    splitAndRenameChannels(file_path);
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");

    run("Create Selection");
    roiManager("Split");

    measureROIs("marker_1");
    saveAs("Results", output + File.separator  + file_list[j] + "_marker_1_results.csv");

    measureROIs("marker_2");
    saveAs("Results", output + File.separator  + file_list[j] + "_marker_2_results.csv");

    roiManager("Save", output + File.separator  + file_list[j] + "_RoiSet.zip");

    selectWindow("ROI Manager");
    close("*");
}
