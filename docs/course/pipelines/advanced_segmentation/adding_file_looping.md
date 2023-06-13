---
tags:
  - pipeline
  - measurement
  - rois
---
# Looping through all our files and saving

In this section, we will finish our macro by adding the code to loop through
files. For this, we can just re-use the code we had in our very first macro,
making the appropriate changes! :wrench:

Remember, the code looks like this:

```javascript title="Opening, Saving and Closing Images"
folder = "path/to/folder";
file_list = getFileList(folder);
number_of_files = file_list.length;

for (i=0; i<number_of_files; i++) {
    file_path = folder + file_list[i];
    open(file_path);

    // do some image processing here :)

    save_path = "path/to/file/";
    saveAs("Tiff", save_path);
    run("Close");
}
```

And now we know what to replace our `// do some image processing here :)`
comment with! Let's also add the code for a GUI to select input and output
folders (remember from yesterday).

```javascript title="Parameters to select input and output folders"
    #@ File (label = "Input directory", style = "directory") input
    #@ File (label = "Ouput directory", style = "directory") output
```

Now we can use these `input` and `output` variables in our file loading. :muscle:

??? example "Add Parameters GUI for the input and output folders, as well as for the classifier."

    ``` javascript
    #@ File (label = "Input directory", style = "directory") input
    #@ File (label = "Ouput directory", style = "directory") output
    #@ File (label = "pixel classifier", style = "file") classifier_path

    file_list = getFileList(input);
    number_of_files = file_list.length;

    for (j=0; j<number_of_files; j++) { //(1)!
        file_path = input + File.separator + file_list[j];
        splitAndRenameChannels(file_path);
        selectWindow("DAPI");
        run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
        run("Area Opening", "pixel=50");
        run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
        run("Set Measurements...", "min redirect=None decimal=3");
        run("Measure");
        max_value = getResult("Max");
        for (i=1; i<=max_value; i++) {
            labelToROI(i);
        }
        measureROIs("marker_1");
        saveAs("Results", "C:/local_course/marker1_results.csv");
        measureROIs("marker_2");
        saveAs("Results", "C:/local_course/marker2_results.csv");
    }
    ```

    1. Important! We have to use j as the iterator of the input file list,
    since we use i later in our script!

We then need to make sure all of our files are saved under the right names and
folders, so let's see how we might do that next! :rocket:
