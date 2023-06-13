/*
* A macro performing computation on two arrays.
*
* License: BSD 3-Clause
*/

/*
 * Compute the sum of an array.
 *
 * Will only work with numerical arrays.
 *
 * Parameters
 * ----------
 * array:
 * 		Array on which to perform the calculation
 *
 * Return
 * ------
 * Sum of all the elements of the array
 */
function computeSum(array) {
	sum = 0;
	for (i = 0; i < array.length; i++) {
		sum += array[i];
	}
	return sum;
}

/*
 * Compute the square sum of an array divided by the mean.
 *
 * The implementation can be simplified. Do you see how?
 *
 * Parameters
 * ----------
 * array:
 * 		Array on which to perform the calculation
 *
 * Return
 * ------
 * Square sum of the array divided by the mean
 */
function computeSquareSumByMean(array){
	// compute sum
	sum = computeSum(array);

	// compute mean
	mean = sum / array.length;

	// return the square sum divided by mean
	return sum * sum / mean;
}

// Define arrays
array1 = newArray(1, 34, 6, 21, 84, 14, 8);
array2 = newArray(54, 24, 67, 28, 42, 2, 17);

// Get the square sum divided by the mean
ssdm1 = computeSquareSumByMean(array1);
ssdm2 = computeSquareSumByMean(array2);

// Compute ratio
ratio = ssdm1 / ssdm2;

// It should print 0.7179
print("Ratio: "+ratio);
