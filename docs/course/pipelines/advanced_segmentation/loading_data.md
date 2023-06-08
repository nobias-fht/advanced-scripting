#Loading and splitting data

The first step in any pipeline is to load the data. We already have seen how to do this

??? warning "You might be tempted to start writing your loop to load all of the images here. Why might this be a bad idea?"
    If your macro starts by loading all the images, then as you build your pipeline, each time you run it to test, it will try to load ALL of the images. This will take a very long time to make and debug your macro. A much better first step is to write your pipeline to analyze one image, and then write the code to apply it to multiple images.


Let's start our macro by loading one image and taking a look at it.


??? question Write a macro that opens one of the files in the folder /data/advanced_segmentation/control, and splits it into its component channels
    ```javascript
    open("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif");
    run("Split Channels");
    ```

While we know that C1 is the nuclei, and C2 and C3 are the markers, each will have a different suffix reflecting the file name. This will make it difficult later on, so let's rename the files for simplicity, like we did before. Unfortunately, we can't just select the windows by name. We have to be a little more clever!

First, we need to get a list of all the open windows. For this we can use the following function:
```javascript title="getting a list of open windows"
list = getList("window.titles");
```

??? question "Write code to iterate through this list and rename the windows in the following order: C1 = nuclei, C2 = marker_1, C3 = marker_2. Hint: You've seen something similar when we renamed the ROIs in the previous exercise!"
    ```javascript hl_lines="3 4 5 6 7 8"
    open("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif");
    run("Split Channels");
    list = getList("image.titles");
    names = newArray("DAPI", "marker_1", "marker_2");  //(1)!
    for (i = 0; i < list.length; i++) {
        selectWindow(list[i]);
        rename(names[i]);
    }
    ```

    1. Can you think of another way of doing this? Maybe using string matching and if/else statements?


Hmmmm this looks like a nice, self-contained bit of code. Maybe we should make it into a function?

??? question "Turn this into a function that takes in a file path as an argument"
    ```javascript
    function splitAndRenameChannels(file) {
        open(file);
        run("Split Channels");
        list = getList("image.titles");
        names = newArray("DAPI", "marker_1", "marker_2");
        for (i = 0; i < list.length; i++) {
            selectWindow(list[i]);
            rename(names[i]);
    }
    }
    splitAndRenameChannels("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif")
    ```

Next, we will apply our pixel classifier to the nuclear image!


