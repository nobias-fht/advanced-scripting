---
tags:
  - recorder
---
# First recording

Let's start the macro recorder and see what happens. Click on
`Plugins > Macro > Record...`. A wild window appears! :hatching_chick:

Now do the following:

1. Open an image (e.g. `File > Open Samples > Blobs`).
2. Run the Variance filter (`Process > Filters > Variance...`) and click `OK`.
3. Change the look-up table to `HiLo` (`Image > Lookup Tables > HiLo`).
4. Click on `Create` in the macro recorder window. This will open a new window.
5. Close the image.
6. Click on `Run` in the macro window. :exploding_head:

## What happened?

The macro recorder recorded all the actions you did in Fiji, and precisely
reproduced the steps once you ran it. :tada:

Did you notice which window opened when you clicked on `Create`?  It is the
macro editor! :open_mouth:

That means that we can use the macro recorder to add steps to our macro, and
then edit it to make it more useful. :sunglasses:

## Command calls

The macro recorder captures functions that are used internally to call ImageJ
commands. One such is the `run` function. It often looks something like this:

```javascript title="run Gaussian blur"
run("Gaussian Blur...", "sigma=4");
```

In this case, the `run` function is used to call the Gaussian blur plugin. The
first argument is the name of the command, and the second is the parameters that
are passed to the command. In this case, the parameter is the sigma value of the
Gaussian blur. :nerd_face:

Some commands will require more parameters than others.
