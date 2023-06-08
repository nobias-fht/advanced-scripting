#Image Thresholding

We want to apply a threshold to this image. We could just pick a number that works well for this image but remember, we're trying to make a script that we could potentially apply to many images. If we select one number that works with this image, it might not work as well with other images.

A better approach is to select an autothreshold method.

??? question "Add to your script steps to threshold both images using ImageJ's autothreshold feature. Hint: You might want to make copies of these files before you threshold them, so that we have the raw images to work with later!"
    ```javascript
    open("path/to/file/bax_DAPI_overlay.tif");
    run("Split Channels");
    selectWindow("C1-bax_DAPI_overlay.tif");
    rename("nuclei");
    selectWindow("C2-bax_DAPI_overlay.tif");
    rename("bax");
    selectWindow("nuclei");
    run("Duplicate...", "title=nuclei_thresholded");
    run("Auto Threshold", "method=Default white"); //(1)!
    selectWindow("bax");
    run("Duplicate...", "title=bax_thresholded");
    run("Auto Threshold", "method=Default white");
    ```

    1. The 'default' method works pretty well here, but feel free to try some other methods and see if you can find a better one!

Oof. our script is getting pretty long, and we haven't even started the analysis. 

??? question "How could we make our script more easy to read?"
    Let's use Functions to try to replace some of that duplicated code.