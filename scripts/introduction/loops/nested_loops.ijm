/*
 * A macro demonstrating nested loops.
 *
 * License: BSD 3-Clause
 */

// Sizes
N = 3;
M = 4;

// Nested loops
for (i = 0; i < N; i++) {
	// Here you should NOT use the same variable name
	for (j = 0; j < M; j++) {
		counter = i * M + j;
		print(counter);
	}
}
