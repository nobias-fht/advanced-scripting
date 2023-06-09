---
tags:
  - pipeline
  - files
---
# Append to a file

We could use the `File.append` function to **append** our new data to the end of
our file. The syntax of this command is similar:

```javascript title="Appending to a file"
File.append("string", "path/to/file");
```

Let's try this. :rocket:

??? question "Make a new script that uses `append` to add new strings to our file."

    ```javascript
    file_name = "path/file_name.txt";
    File.append("string", file_name);
    ```

Try appending a few different things to the file. :gear:

??? question "What happens when we try to `append` a string to a file that does not exist?"
    Just like the `print` command we saw earlier, ImageJ will create the file.

??? example "Update your script so that it uses `File.append` to write our coordnates to a file. Make sure that it prints in the form `x-coordinate, y-coordinate` for each pair of coordinates"

    ```javascript hl_lines="2 4"
    macro "get_mouse_xy [g]" {
      file_name = "path/to/file.txt";
      getCursorLoc(x, y, z, modifiers);
      File.append(x + "," + y, file_name);

      if (getSliceNumber + 1 < nSlices) {
          setSlice(getSliceNumber + 1);
      }
    }
    ```

Try opening our data in excel. You will have to tell excel that the file is
delimited by the `,` symbol. :clipboard:

## Bonus exercise

??? example "Add a header to the columns in our file. Hint: We will need to do something just after our file is created for the first time. How can we know if our file has just been created? Take a look at the documentation for the `File` functions and see if something might work?"

    ```javascript hl_lines="4 5 6 7"
    macro "get_mouse_xy [g]" {
      file_name = "path/test_track.txt";

      if (!File.exists(file_name)) {
        File.append("X, Y", file_name); // (1)!
      } else {
        getCursorLoc(x, y, z, modifiers);
        File.append(x + "," + y, file_name);
      }

      if (getSliceNumber + 1 < nSlices) {
        setSlice(getSliceNumber + 1);
      }
    }
    ```

    1. Even if you didn't get to this answer, take a look at it and try to understand what's going on. How are we finding out of the file is newly created?
