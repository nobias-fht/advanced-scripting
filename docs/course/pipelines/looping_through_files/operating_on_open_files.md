---
tags:
  - pipeline
  - processing
---
# Processing the images

Now that we have opened our files, we can (finally!) do something with them.

In this case, we will apply a gaussian blur to all of the files, with a given
sigma.

??? question  "Find the command to apply a gaussian blur of sigma 2."

    ```javascript
    run("Gaussian Blur...", "sigma=2");
    ```

Add this file to your script. Think about where in the script this should go,
and why. :thinking:

??? example "Macro: Open, Save and Close Files"

    ```javascript hl_lines="8"
    folder = "XXX/XXX/XXX"; // <= replace with your (OS-agnostic) folder path
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++){
      file_path = folder + File.separator + file_list[0];
      open(file_path);
      run("Gaussian Blur...", "sigma=2");
    }
    ```

Now if you run this script it will open the images, and once each file is
opened, apply a gaussian blur to the image.

However, rather than just applying this to every image and keeping them all
open, let's instead save each file after we apply a gaussian blur, and then
close it before we open the next in line.
