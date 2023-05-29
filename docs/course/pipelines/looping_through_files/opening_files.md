# Opening Files

In this section we will start building our actual script piece-by-piece. The script we are currenly working on in any section will always appear like this:


!!! example "Our Script"

    ```javascript
    //our script will be here!
    ```

Let's start by putting in our loop functionality from the previous section.

??? example "Macro: Open, Save and Close Files"
    ```javascript
    folder = "XXX/XXX/XXX"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++)
        {

        }
    ```



Now that we have learned how to loop through files, we will now open them. How can we find out how to open files? Remember that  but one easy way to find out what macro commands are is to use the macro recorder to record and action in the GUI.


In this case we can see that the function to open a file is

```javascript
open("path/to/file");
```

What should we put for "path/to/file"? This is the `path` of a file, which is like an address to where the file lives on the computer. In this case we know the path of our files is `XXXX`. We need to pass in as an argument to the `open` function a concatenation of this path (a string) and the file name (another string).


??? question "How can we generate a path to open? (hint: remember the string concatenation section)?"
    ```javascript

        folder = "XXX/XXX/XXX"
        file_list = getFileList(folder);
        number_of_files = file_list.length;

        file_path = folder + "file_list[0]
        print(file_path)
    ```

Play around with this script a bit. See what happens when you change various things. Make sure you understand, in the final `file_path` variable, where each of the components come from.


Now, add this logic to your script, but instead of using `print` to print the path of the file, use `open` to open the file

??? example "Macro: Open, Save and Close Files"
    ```javascript

    folder = "XXX/XXX/XXX"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++)
        {
            file_path = folder + "file_list[0]
            open(file_path)
        }
    ```

If you run the code in the second cell, you will see that all files will open!