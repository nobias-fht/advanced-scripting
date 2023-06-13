/*
 * A macro demonstrating different types of arrays.
 *
 * License: BSD 3-Clause
 */

// Instantiate arrays
size = 3;
string_array = newArray(size);
integer_array = newArray(size);
mixed_array = newArray(size);

// Assign values
string_array[0] = "Let";
string_array[1] = "it";
string_array[2] = "be";

integer_array[0] = 14;
integer_array[1] = 7;
integer_array[2] = 1791;

mixed_array[0] = "A string";
mixed_array[1] = 42;
mixed_array[2] = 3.1415;

// Print the arrays
Array.print(string_array);
Array.print(integer_array);
Array.print(mixed_array); // Yes we can mix types in an array!
