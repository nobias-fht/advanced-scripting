#Writing to an external file

Right now we're just printing the coordinates at every frame. This is useful, but the log is not meant to be a place to store values. What we would really like to do is write these coordinates to a file, so that we can use them later.

The way we write to a file in ImageJ macro is using the `print` command. We've already seen this when we're printing to the console. To print to a file, we just have to tell it what file to print to as an additional argument to `print()`. But first we have to `open` a file.

```javascript
file_name = "path\file_name.txt";
file = File.open(file_name);
print(file, "string to print");
```

If the `file` does not exist, imageJ will create it.

??? question "write the string "this is inside a file now" to a file named "my_first_file.txt". 
    ```javascript
    file_name = "path\file_name.txt";
    file = File.open(file_name);
    print(file, "this is inside a file now");
    ```

If we look in the folder that we saved our file to, we should see our file there, with our content written to it.

??? question "What happens if you run the same script but with a different string?
    ImageJ will overwrite the file with the new content.

Change your code so that instead of printing to the console, it writes to a file and try your script again. Try tracking an object for a few frames. What does the output file look like? Why might this be?

??? question "Overwriting a file"
    ImageJ will overwrite this file every time this macro is run. Since we will be running this macro every frame that means that we will only have the last frame written. How could we overcome this? Take a look at the "File Functions" section of the imageJ macro documentation and see if you can find a command that might work.








