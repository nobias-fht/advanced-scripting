/*
* A macro that performs basic segmentation using thresholding.
*
* License: BSD 3-Clause
*/
function measureIntersect(roi_1, roi_2) {
    roiManager("Select", indexArray(RoiManager.getIndex(roi_1),RoiManager.getIndex(roi_2)));
    roiManager("AND");
    run("Measure");
}

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
measureIntersect("nuclei", "bax");
measureIntersect("nuclei_inverted", "bax");
