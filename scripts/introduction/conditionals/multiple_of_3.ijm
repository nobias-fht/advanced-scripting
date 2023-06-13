/*
 * A macro that warns users when a number if divisble by 3.
 *
 * License: BSD 3-Clause
 */

for (i = 1; i <= 10; i++) {
	if (i % 3 == 0){
		print("Warning: "+i+" is divisible by 3!");
	} else {
		print(i);
	}
}
