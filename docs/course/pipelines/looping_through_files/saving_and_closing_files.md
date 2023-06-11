---
tags:
  - pipeline
  - files
---
# Saving and Closing Files

The command to save a file is very similar to the command to open a file,
except that in addition to a path (where we want to save to), we also need to
give it a type of file to save. In this case, let's save our images as
`Tiff` files.

```javascript
saveAs("Tiff", "path/to/file");
```

Now we can just pass in the path that we want to save to. Let's just save them
to the same folder as our input images (although, in reality, its generally
good practice to save them in a different place so as not to confuse your inputs
and outputs).

Similarly to how we build a `file_path` for the input image to pass into the
`open()` function, make a different filename for each files, and make sure that
the filename relects what we have done to it (something along the lines of
`normal_0_gaussian_blur_sigma2.tif`).

??? question "What would happen if you changed `Tiff` to `Jpeg` in the above code?"
    We would stop the course and go outside to settle the disagreement. :bat:

    `jpeg` is often lossy, which means it removes information from the image
    when it saves it. This is not what you want to do with scientific images.
    :collision:

??? example "Macro: Open, Save and Close Files"

    ```javascript hl_lines="9 10"
    folder = "path/to/file"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++) {
        file_path = folder + File.separator + file_list[0];
        open(file_path);
        run("Gaussian Blur...", "sigma=2");
        save_path = folder + File.separator + "normal_" + i + "_gaussian_blur_sigma2.tif";
        saveAs("Tiff", save_path);
    }
    ```

Look closely at the line where we define the `save_path` variable. Make sure you
understand what is going on. You could also use the `print` command to see what
the output would be.

After this, all that remains is to add the code to `close` the file. Find the
command to do this and add it to the last line of your macro.

??? example "Macro: Open, Save and Close Files"

    ```javascript hl_lines="11"
    folder = "path/to/file"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++) {
        file_path = folder + File.separator + file_list[0];
        open(file_path);
        run("Gaussian Blur...", "sigma=2");
        save_path = folder + File.separator + "normal_" + i + "_gaussian_blur_sigma2.tif";
        saveAs("Tiff", save_path);
        run("Close");
    }
    ```

Take a moment to look through the above code.

??? Question "How would you document your code?"

    ```javascript
    /*
     * A macro to perform a gaussian blur on each image in a folder.
     *
     * License: BSD 3-Clause
     */
    // Folder in which the images are
    folder = "path/to/file";

    // Get the list of files in the folder
    file_list = getFileList(folder);

    // Check how many files there are in the folder
    number_of_files = file_list.length;

    // Loop through each file
    for (i=0; i<number_of_files; i++) {
        // Construct the path to the file
        file_path = folder + File.separator + file_list[0];

        // Open the file
        open(file_path);

        // Apply a gaussian blur with sigma 2
        run("Gaussian Blur...", "sigma=2");

        // Construct the path to save the file
        save_path = folder + File.separator + "normal_" + i + "_gaussian_blur_sigma2.tif";

        // Save the image
        saveAs("Tiff", save_path);

        // Close the image
        run("Close");
    }
    ```
