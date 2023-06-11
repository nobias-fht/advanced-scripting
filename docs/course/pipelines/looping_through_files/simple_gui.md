---
tags:
  - pipeline
  - parameters
---
# Bonus section: Adding a simple Graphical User Interface!

The script we made in the previous section will apply to an entire folder of
images. However, when we want to process a different folder, we would have to
manually edit the code. :chart_with_downwards_trend:

??? Question "Which line(s) of code do would need to change to process a different folder?"

    ```javascript hl_lines="1"
    folder = "path/to/file";  // (1)!
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

    1. This one. :wink:

What if we wanted to change the output folder? The same concern arises. :fire:

Instead, we can use a simple GUI to allow the user to select the folder to
process. Fiji provides some handy helpers for this, called `parameters`. In this
case, we can put at the top of our macro the following line:

```javascript
#@ File (label = "Input directory", style = "directory") folder
```

What this will do is open a file dialog, which will allow the user to select a
folder to process. The selected folder will be stored in the `folder` variable.
Note that we could have called this whatever we want, but since we used the
variable name `folder` already in our script, it makes sense to keep it the
same. :thumbs_up:

??? question "What would happen if we changed `style = "directory"` to `style = "file"`?"
    The user would be prompted to select a single file, rather than a folder.
    This can also be useful, but is not what we want for this script. :wink:

??? question "Modify your script to add `parameters` for the input and output folders."

    ```javascript hl_lines="1 2"
    #@ File (label = "Input directory", style = "directory") input_folder
    #@ File (label = "Output directory", style = "directory") output_folder

    file_list = getFileList(input_folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++) {
        file_path = folder + File.separator + file_list[0];
        open(file_path);
        run("Gaussian Blur...", "sigma=2");
        save_path = output_folder + File.separator + "normal_" + i + "_gaussian_blur_sigma2.tif";
        saveAs("Tiff", save_path);
        run("Close");
    }
    ```
