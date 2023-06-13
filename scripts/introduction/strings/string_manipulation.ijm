/*
 * A macro demonstrating string manipulation.
 *
 * License: BSD 3-Clause
 */

// String value
string = "my_new_8463_file.tif"

///////////////////////
// Version 1: substring

// Get indices
index_8 = indexOf(string, "8");
index_3 = indexOf(string, "3");

// Reconstitute string
output = substring(string, 0, index_8-1) + substring(string, index_3+1);
print(output);

///////////////////
// Version 2: split

// Split at the "_"
array = split(string, "_");

// Reconstitue the string
output = array[0] + "_" + array[1] + "_" + array[3];
print(output);

/////////////////////////////
// Version 3: split variation

// Make new array
array2 = newArray(array[0], array[1], array[3]);

// Join the array with delimiter
output = String.join(array2, "_")
print(output);
