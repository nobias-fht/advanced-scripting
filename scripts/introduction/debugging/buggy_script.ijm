/*
 * A macro with errors.
 *
 * Corrections are indicated with "<=" comments.
 *
 * License: BSD 3-Clause
 */

// Starting value
number = 0;

// Add the sum of all odd values up to 9
for (i = 0; i < 9; i++) { // <= this only goes up to 9
	// increase number only if i is odd
	if(i % 2 != 1){ // <= this should be "i % 2 == 1" for odd values
		number += i	// <= missing ";"
	}
}

// Create a string and print
string = "The number is "+number"."; // <= missing a "+"
print(string)

// The number should be 25
