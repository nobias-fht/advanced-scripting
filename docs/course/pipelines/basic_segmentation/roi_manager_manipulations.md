---
tags:
  - pipeline
  - rois
---
# Working with the ROI manager

The ROI manager contains an array of ROIs. Right now you should have three, in
the order in which they were added (in our code, we added the nuclei first,
then the non-nuclei, and then finally the bax -- your order might be different!)

Let's leave behind our script and play with the ROI manager for a bit. We will
integrate this back into our code soon. :clock:

To select an entry in the ROI manager, we use the following command:

```javascript title="Selecting ROIs in the ROI manager"
    roiManager("Select", index);
```

Here, `index` refers to the position in the ROI manager array.

??? question "Write code to sequentially select each ROI in the list. *Hint*: You can do this by writing three lines of code, or if you would like an extra challenge, use a `for` loop!"

    ```javascript title="Looping through the ROI manager"
    //three lines
    roiManager("Select", 0);
    roiManager("Select", 1);
    roiManager("Select", 2);

    //using a for loop;
    for (i=0; i<3; i++) {
        roiManager("Select", i); //(1)!
    }
    ```

    1. In our loop here, we have hard-coded the length of the roi list (3). Why
    is this bad? How could we fix it? Look at the documentation for the ROI
    manager and see if you can find a function to find out how many entries are
    in the array.

Now that we can loop through our ROIs, let's rename them.

??? question "Find the command to rename ROIs in the ROI manager. Add this code to your code above (we will use the loop implementation from here on...) and rename all the ROIs. Remember the order they were added in!"

    ```javascript title="Renaming ROIs in the ROI manager"

        name_array = newArray("nuclei", "nuclei_inverted", "bax")

        for (i=0; i<roiManager("count"); i++) {
            roiManager("Select", i);
            roiManager("rename", name_array[i]);
        }
    ```

Now we can select entries just using their names!
Try `RoiManager.selectByName("nuclei");`. :tada:

Next, let's return to our task and build a macro that measures the area and
intensity of the bax signal inside and outside the nucleus (using our fancy new
ROI manager skills!) :nerd:

??? example "Before we do, let's add the renaming code to our script"

    ```javascript hl_lines="22 23 24 25 26"
    open("path/to/file/bax_DAPI_overlay.tif");
    run("Split Channels");
    selectWindow("C1-bax_DAPI_overlay.tif");
    rename("nuclei");
    selectWindow("C2-bax_DAPI_overlay.tif");
    rename("bax");
    selectWindow("nuclei");
    run("Duplicate...", "title=nuclei_thresholded");
    run("Auto Threshold", "method=Default white");
    selectWindow("bax");
    run("Duplicate...", "title=bax_thresholded");
    run("Auto Threshold", "method=Default white");
    selectWindow('nuclei_thresholded');
    run("Create Selection");
    roiManager("Add");
    run("Make Inverse");
    roiManager("Add");
    selectWindow('bax_thresholded');
    run("Create Selection");
    roiManager("Add");

    name_array = newArray("nuclei", "nuclei_inverted", "bax")
    for (i=0; i<roiManager("count"); i++) {
        roiManager("Select", i);
        roiManager("rename", name_array[i]);
    }

    ```
