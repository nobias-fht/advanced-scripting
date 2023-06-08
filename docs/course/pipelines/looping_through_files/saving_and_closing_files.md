# Saving and Closing Files

The command to save a file is very similar to the command to open a file, except in addition to a path (where we want to save to), we also need to give it a type of file to save. In this case, let's save our images as Tiff files.


```javascript
saveAs("Tiff", "path/to/file");
```

Now we can just pass in the path that we want to save to. Let's just save them to the same folder as our input images (although, in reality, its generally good practice to save them in a different place so as not to confuse your inputs and outputs).

Similarly to how we build a file_path for the input image to pass into the 'open()' function,Make a different filename for each files, and make sure that the filename relects what we have done to it (something along the lines of _normal_0_gaussian_blur_sigma2.tif)

??? question "What would happen if you changed `Tiff` to `Jpeg` in the above code?"
    We would beat you to death with your laptop

??? example "Macro: Open, Save and Close Files"
    ```javascript
    folder = "path/to/file"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++)
        {
            file_path = folder + "file_list[i];
            open(file_path);
            run("Gaussian Blur...", "sigma=2");
            save_path = folder + "/normal_" + i + "_gaussian_blur_sigma2.tif";
            saveAs("Tiff", save_path);
        }
    ```


Look closely at the line where we define the `save_path` variable. Make sure you understand what is going on. You could also use the `print` command to see what the output would be.

After this, all that remains is to add the code to `close` the file. Find the command to do this and add it to the last line of your macro.


??? example "Macro: Open, Save and Close Files"
    ```javascript
    folder = "path/to/file"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++)
        {
            file_path = folder + "file_list[0];
            open(file_path);
            run("Gaussian Blur...", "sigma=2");
            save_path = folder + "normal_" + i + "_gaussian_blur_sigma2.tif";
            saveAs("Tiff", save_path);
            run("Close");
        }
    ```

Take a moment to look through the above code. Make sure you understand what each line is doing.

??? Question "At the end of each line, use a comment `//` to put a description of what the line is doing. This will help solidify your understanding of the code"
    ```javascript
    folder = "path/to/file"
    file_list = getFileList(folder);  //get the list of files in the folder
    number_of_files = file_list.length; //find out how many files there are in the folder

    for (i=0; i<number_of_files; i++) //make a loop that generates a sequential integer for every file in the array and assigns it to the variable 'i'
        {
            file_path = folder + "file_list[0]; //construct the file path using the folder path and the file we want to open from the array
            open(file_path); //open the file
            run("Gaussian Blur...", "sigma=2"); //run a gaussian blur with a sigma of 2 on the image
            save_path = folder + normal_" + i + "_gaussian_blur_sigma2.tif"; //construct a new file path to save the modified image
            saveAs("Tiff", save_path); //save the image
            run("Close"); //close the image
        }
    ```
