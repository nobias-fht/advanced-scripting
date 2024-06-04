/*
* A macro that writes cursor position to a file
* when the hotkey `g` is pressed and moved the
* stack to the next slice.
*
* This macro needs to be installed using
* `Plugins > Macro > Install`.
*
* Modify `file_name` to point to the file you
* want to write to.
*
* License: BSD 3-Clause
*/
macro "get_mouse_xy [g]" {
    // Path to the file
    file_name = "path/test_track.txt";

    // If file doesn't exist, add table headers
    if (!File.exists(file_name)) {
        File.append("X, Y", file_name);
    } else {
        // Grab cursor position
        getCursorLoc(x, y, z, modifiers);

        // Add to file
        File.append(x + "," + y, file_name);
    }

    // Move to the next slice
    if (getSliceNumber + 1 < nSlices) {
        setSlice(getSliceNumber + 1);
    }
}
