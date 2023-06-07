---
tags:
  - pipeline
  - files
---
# Writing to an external file

Right now we're just printing the coordinates at every frame. This is useful,
but the log is not meant to be a place to store values. What we would really
like to do is write these coordinates to a file, so that we can use them later. :memo:

The way we write to a file in ImageJ macro is using the `print` command, just
like when writing to the log. :exploding_head:

To print to a file, we just have to tell it what file to print to as an
additional argument to `print()`. But first we have to `open` a file: :open_file_folder:

```javascript title="Opening a file"
file_name = "path/file_name.txt";
file = File.open(file_name);
print(file, "string to print");
```

If the `file` does not exist, ImageJ will create it. :gear:

!!! question
    Write the string "this is inside a file now" to a file named
    `my_first_file.txt`.

If we look in the folder that we saved our file to, we should see it, with our
content written to it. :eyes:

Change your code so that instead of printing to the console, it writes to a
file and try your script again. Try tracking an object for a few frames. What
does the output file look like?

??? question "What happens if you run the same script but with a different string?"
    ImageJ will overwrite the file with the new content! :scream:

??? question "Overwriting a file"
    ImageJ will overwrite this file every time this macro is run. Since we will
    be running this macro every frame that means that we will only have the last
    frame written. How could we overcome this? Take a look at the
    `File Functions` section of the ImageJ macro documentation and see if you
    can find a command that might work.
