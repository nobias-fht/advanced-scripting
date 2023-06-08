# Summary

In this lesson, we have learned how to take a folder of images, open them one by one, apply a minpulation to each image and then save the resulting image.

This flow is the backbone of many image processing automations. You could imagine expanding the section in between opening and saving/closing the file to include many other manipulations and measurements, looping through as many files as you have. In fact, we will do exactly this in future sections Hopefully you can begin to appreciate the power of ImageJ macros.

For now, you have the following code you can re-use in many other macros macros

```javascript title="Opening, Saving and Closing Images"

folder = "path/to/file"
file_list = getFileList(folder);
number_of_files = file_list.length;

for (i=0; i<number_of_files; i++)
    {
        file_path = folder + file_list[i];
        open(file_path);

        // do some image processing here :)

        save_path = "path/to/file/";
        saveAs("Tiff", save_path);
        run("Close");
    }
```
