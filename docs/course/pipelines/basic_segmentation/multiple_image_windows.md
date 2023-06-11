---
tags:
  - pipeline
  - windows
---
# Dealing with multiple images

We have a two-channel image, and we would like to perform some quantification on
these images. Let's say we're interested in two things:

* What is the area of the *bax* staining is inside and outside the nucleus
* Whether the average intensity of the staining inside the nucleus is higher
than the intensity outside the nucleus

First, we need to split the channels. :scissors:

??? example "Make a macro that opens the raw image and splits the two channels"

    ```javascript
    open("path/overlay.tif");
    run("Split Channels");
    ```

Now we have two files. Unfortunately, they are not named very intuitively.
Let's fix that. :wrench:

??? example "Add lines to your script that renames `C1-bax_DAPI_overlay.tif` to `nuclei` and `C2-bax_DAPI_overlay.tif` to `bax`."

    ```javascript hl_lines="3 4 5 6"
    open("path/to/file/bax_DAPI_overlay.tif");
    run("Split Channels");
    selectWindow("C1-bax_DAPI_overlay.tif");
    rename("nuclei"); // (1)!
    selectWindow("C2-bax_DAPI_overlay.tif");
    rename("bax");
    ```

    1. Generally when working with multiple images in a script, it's a good idea
    to rename them so that we can see what is what more easily later in our
    script.

Now we can select the windows using their new names `nuclei` and `bax`. Handy! :ok_hand:
