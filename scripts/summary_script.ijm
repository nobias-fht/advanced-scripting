/*
 * Description of the macro.
 *
 * Pre-requisite:
 * 	- file system organization (ie name of folders, naming conventions etc.)
 * 	- type of data (ie "tif", channels / z, type of specimen)
 * 	- etc.
 *
 * 	Warning:
 * 	This script will close all windows to avoid errors, save any unsaved
 * 	work before running it.
 *
 * Links:
 * 	(Publication, website, repository, link to data)
 *
 * License: BSD-3-Clause (for instance)
 * Authors: Name Surname, Name Surname
 * 			Institute
 */
 #@ File (label = "Input directory", style = "directory") input
 #@ File (label = "Ouput directory", style = "directory") output

 // Make sure everythin is closed before
 //roiManager("deselect");
 //roiManager("delete");
 //run("Clear Results");
 close("*");

 function doSomething(param1, param2) {
	/*
	 * This function does something.
	 *
	 * Pre-requisite:
	 * This function is run after [blah blah].
	 *
	 * Parameters (Optional)
	 * ----------
	 * param1:
	 * 		Description of what param1 is.
	 * param2:
	 * 		Description of what param2 is.
	 *
	 * Returns (Optional)
	 * -------
	 * return_value:
	 * 		Description of the return value.
	 */

	 // Do something with param1 and param2

	 // Get return value
	 return_value  = ...;

	 return return_value;
 }

 function isTiff(file_path) {
	/*
	 * Check if a file is a Tiff file.
	 *
	 * Parameters
	 * ----------
	 * file_path:
	 * 		Path to the file
	 *
	 * Returns
	 * -------
	 * return:
	 * 		1 if the file is a Tiff, 0 otherwise
	 */

	 // Lower the string
	 lower_path = toLowerCase(file_path);

 	 // Check if it is a tiff using the extension
 	 if (endsWith(lower_path, ".tif")){
 	 	return 1;
 	 } else if (endsWith(lower_path, ".tiff")){
 	 	return 1;
 	 }

	 // Return false
	 return 0;
 }

 // List files in the input folder
 file_list = getFileList(input);

 // Create an Array of the same size
 values_array = newArray(file_list.length);

 // Loop over the files and do something
 for (i = 0; i < file_list.length; i++) {

	// if the file is a tiff, do something
	if(isTiff(file_path)){

		// get the value back from do something
		value = doSomething(file_path, 2.5);

		// and put it in the array
		values_array[i] = value;

		// Save image (if doSomething changed the image!)
		save_path = output + File.separator + "processed_" + file_list[i];
	    saveAs("Tiff", save_path);

		// Close everything
		close("*");
	}
 }
