/*
 * A macro demonstrating how to run a for loop or
 * a while loop to execute the same task.
 *
 * License: BSD 3-Clause
 */

 // Example with a for loop
 for (i = 0; i < 20; i++) {
 	// use 1-indexed counting
	n = i + 1;

	// print to log
	print("Running iteration "+n);
 }

 // and now with a while loop
 counter = 0;
 while (counter < 20) {
 	// use 1-indexed counting
 	n = counter + 1;

 	// print to log
 	print("Running iteration "+n);

 	// increase the counter
 	counter++;
 }

 // Why use a while loop then? Because you might
 // be dealing with an unknown number of iterations.
