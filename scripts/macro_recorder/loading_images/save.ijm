/*
 * A macro demonstrating image saving.
 *
 * License: BSD 3-Clause
 */

// Open an image from the disk
open("blobs/blobs.tif");

// Save the image
user_name = ""; // <= put your user name here
saveAs("Tiff", "/Users/"+user_name+"/Desktop/blobs.tif");
