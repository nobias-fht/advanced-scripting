#Using our trained pixel classifier

Using our classifier is very simple. Like using other ImageJ plugins via a macro, we use the `run` command, passing in our segmenter 

```javascript title="segmenting images with labkit"
classifier_path = "path/to/classifier";
run("Segment Image With Labkit", "segmenter_file=" + classifier_path use_gpu=false");
```

??? question "Add the code to run the pixel classification step on your DAPI image (note that from here, to save space, we will not include the functions in every script, since we assume you have them in your script file)"
    ```javascript
    splitAndRenameChannels("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif")
    selectWindow("DAPI");
    classifier_path = "C:\\local_course\\nuclei_classifier.classifier";
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    ```

Our segmentation is blank!

Not to worry, it's just that the segmented nuclei have a value of 1, which is very. very dark. Add the following line to your macro and you will see your beautiful segmented nuclei!

```javascript
run("Enhance Contrast", "saturated=0.35");
```

We have a pixel-classified image, that is to say an image where we can distinguish foreground (nuclei) from background (non-nuclei). This is close to what we want, but isn't quite there. We need an <i>instance segmentation</i>, where we can tell each nucleus apart from every other nucleus. After that, let's clean up any tiny objects that might be floating around due to segmentation errors.

We will accomplish both of these feats using the MorphoLibJ plugin. First we will filter using `area opening` to remove objects too small to be nuclei. How small? We could try various parameters and see what gives a good result, since the nuclei have a reasonably consistent size. Hint: This could be a argument that could be passed into a function! Next we will use `connected component labelling` to make each nucleus have it's own label. 

??? question "Add the code to run run connected component labeling and then size filtering to you macro"
    ```javascript
    splitAndRenameChannels("C:/local_course/data/advanced_segmentation/control/siCntrl_1.tif")
    classifier_path = "C:\\local_course\\nuclei_classifier.classifier";
    selectWindow("DAPI");
    run("Segment Image With Labkit", "segmenter_file=" + classifier_path + " use_gpu=false");
    run("Area Opening", "pixel=50");
    run("Connected Components Labeling", "connectivity=4 type=[8 bits]");
    ```

If all goes well, you should have a beautifully segmented field of nuclei. 

Now, to turn these nuclei into ROIs that we can measure!

