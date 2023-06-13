/*
* A macro formatting a string.
*
* License: BSD 3-Clause
*/

// Set path
home = getDirectory("home");
path = home+"Desktop"+File.separator+"projects"+File.separator+"20230612"+File.separator+"imaging_confocal";

/*
 * A function returning the index of the value in the array.
 *
 * If the value is not in the array, the function returns -1.
 *
 * Parameters
 * ----------
 * array:
 * 		Array of reference
 * value:
 * 		Value in the array
 *
 * Returns
 * -------
 * Index of the value in the array, -1 if the value is not in
 * the array
 */
function indexInArray( array, value ) {
	// Loop over the array indices
	for (i=0; i<array.length; i++) {
		// Check if value is equal to ith element
    	if ( array[i] == value ) {
    		// Return index
        	return i;
        }
    }
    // else, return -1
    return -1;
}

/*
 * Return the month corresponding to the number.
 *
 * Parameters
 * ----------
 * month:
 * 		String corresponding to a month number
 *
 * Returns
 * -------
 * Month written out, or Invalid if the number was incorrect.
 */
function getMonth(month){
	if (month == "01"){
    	return "January";
    } else if(month == "02"){
        return "February";
    } else if(month == "03"){
        return "March";
    } else if(month == "04"){
    	return "April";
    } else if(month == "05"){
        return "May";
    } else if(month == "06"){
        return "June";
    } else if(month == "07"){
        return "July";
    } else if(month == "08"){
        return "August";
    } else if(month == "09"){
        return "September";
    } else if(month == "10"){
        return "October";
    } else if(month == "11"){
        return "November";
    } else if(month == "12"){
	    return "December";
    } else {
    	return "Invalid month";
    }
}

/*
 * Prints a pretty sentence.
 *
 * Parameters
 * ----------
 * day:
 * 		String representing the day in the month
 * month:
 * 		String reprensenting the month in the year (numerical)
 * year:
 * 		String representing the year
 */
function prettyDate(day, month, year){
	prettyMonth = getMonth(month);

	print("The experiment was performed on the "+day+"th of "+prettyMonth+" "+year+".");
}

// Split the path in folders
folders = split(path, File.separator);

// Find the project index in the folders array
index_project = indexInArray(folders, "projects");

// Extract date, day, month and year
date = folders[index_project+1];
year = substring(date, 0, 4);
month = substring(date, 4, 6);
day = substring(date, 6, 8);

// Print pretty date
prettyDate(day, month, year);
