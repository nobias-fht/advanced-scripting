/*
 * A macro demonstrating array indexing.
 *
 * License: BSD 3-Clause
 */

// Instantiate array
// my_array = newArray(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
my_array = Array.getSequence(11);

// Print the 2nd, 5th and 8th values.
print("2nd entry: "+my_array[1]); // arrays are 0-indexed
print("5th entry: "+my_array[4]);
print("8th entry: "+my_array[7]);
