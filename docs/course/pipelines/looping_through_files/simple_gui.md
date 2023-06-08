# Bonus section: Adding a Simple  Graphical User Interface (GUI)!

The script we made in the previous section will apply to an entire folder of images. However, when we want to process a different folder, we would have to manually edit the code.

??? Question "Think about which line(s) of code we would need to change to process files in a different folder"
    ```javascript
    folder = "path/to/file"  //This one :)
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++)
        {
            file_path = folder + "file_list[i];
            open(file_path);
            run("Gaussian Blur...", "sigma=2");
            save_path = folder + "normal_" + i + "_gaussian_blur_sigma2.tif";
            saveAs("Tiff", save_path);
            run("Close");
        }

    ```

What if we wanted to change the output folder? We would have to change another line of code. And we would have to do both of these things every time we wanted to process a new folder.

Instead, we can use a simple GUI to allow the user to select the folder to process. Fiji provides some handy helpers for this. In this case, we can put at the top of our macro the following line

```javascript
#@ File (label = "Input directory", style = "directory") folder
```

What this will do is open a file dialog, which will allow the user to select a folder to process. The selected folder will be stored in the `folder` variable. Note that we could have called this whatever we want, but since we used the variable name `folder` already in our script, it makes sense to keep it the same.

??? question "What do you think would happen if we changed `style = "directory"` to `style = "file"` in the code above?"
    The user would be prompted to select a single file, rather than a folder. This can also be useful, but is not what we want for this script.


??? question "Modify your script so that it contains two folder selection dialogs, one to select an input folder, and one to select an output folder"
    ```javascript

    #@ File (label = "Input directory", style = "directory") input_folder
    #@ File (label = "Output directory", style = "directory") output_folder

    file_list = getFileList(input_folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++)
        {
            file_path = folder + "file_list[0];
            open(file_path);
            run("Gaussian Blur...", "sigma=2");
            save_path = output_folder + "normal_" + i + "_gaussian_blur_sigma2.tif";
            saveAs("Tiff", save_path);
            run("Close");
        }

    ```
