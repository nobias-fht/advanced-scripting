/*
* A macro to perform a gaussian blur on each image in a folder.
*
* License: BSD 3-Clause
*/
#@ File (label = "Input directory", style = "directory") input_folder
#@ File (label = "Output directory", style = "directory") output_folder

// Get the list of files in the folder
file_list = getFileList(input_folder);

// Check how many files there are in the folder
number_of_files = file_list.length;

// Loop through each file
for (i=0; i<number_of_files; i++) {
    // Construct the path to the file
    file_path = input_folder + File.separator + file_list[0];

    // Open the file
    open(file_path);

    // Apply a gaussian blur with sigma 2
    run("Gaussian Blur...", "sigma=2");

    // Construct the path to save the file
    save_path = output_folder + File.separator + "normal_" + i + "_gaussian_blur_sigma2.tif";

    // Save the image
    saveAs("Tiff", save_path);

    // Close the image
    run("Close");
}
