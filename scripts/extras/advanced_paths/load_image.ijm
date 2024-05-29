/*
 * A macro opening blobs.tif using an OS agnostic path.
 *
 * This macro requires the blobs.tif to be placed in
 * a "blobs" folder on the Desktop.
 *
 * License: BSD 3-Clause
 */

// Get the user directory
home = getDirectory("home");

// Create path to images
path = home+"Desktop"+File.separator+"blobs"+File.separator+"blobs.tif";

// Open images
open(path);
