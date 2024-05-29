/*
 * A macro demonstrating problematic loops.
 *
 * WARNING: this script has infinite loops, you
 * will probably have to kill your Fiji session
 * if you run it.
 *
 * License: BSD 3-Clause
 */

// Problem: the condition i>10 is never met.
// Solution: use i<10 instead.
for (i=0; i>10; i++){
	print(i);
}

// Problem: i decreases (i--) and starts at 0, the
// condition i<10 is always met. Infinite loop!
// Solution: change one of the instruction (starting,
// end, update) so that the loop ends.
for (i=0; i<10; i--){
	print(i);
}
