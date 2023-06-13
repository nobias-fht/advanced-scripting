---
tags:
  - pipeline
  - files
---
# Opening Files

In this section we will start building our actual script piece-by-piece. The
script we are currently working on in any section will always appear like this:

!!! example "Our Script"

    ```javascript
    //our script will be here!
    ```

!!! Important
    Whenever the script is hidden in a drop-down menu, try to come up with the
    solution yourself before looking at the answer.

Let's start by putting in our loop functionality from the previous section:

??? example "Macro: Open, Save and Close Files"

    ```javascript
    folder = "path/to/file"
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++) {
        // nothing yet
    }
    ```

Now that we have learned how to loop through files, we will open them. How can
we find out how to open files? There are always two answers:

* Go to the ImageJ macro guide :mortar_board:
* Use the macro recorder :o2:

In this case we can see using the macro recorder that the function to open a
file is:

```javascript
open("path/to/file");
```

What should we put for "path/to/file"? This is the `path` of a file, which is
like an address to where the file lives on the computer. In this case we know
the path of our files is `path/to/tile`. We need to pass in as an argument to
the `open` function a concatenation of this path (a string) and the file name
(another string).

??? question "How can we generate the path?"

    ```javascript
    folder = "path/to/file";
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    file_path = folder + File.separator + file_list[0];
    print(file_path);
    ```

Play around with this script a bit. See what happens when you change various
things. Make sure you understand, in the final `file_path` variable, where each
of the components come from.

Now, add this code snippet to your script, but instead of using `print` to
print the path of the file, use `open` to open the file.

??? example "Macro: Open, Save and Close Files"

    ```javascript hl_lines="6 7"
    folder = "path/to/file";
    file_list = getFileList(folder);
    number_of_files = file_list.length;

    for (i=0; i<number_of_files; i++) {
        file_path = folder + File.separator + file_list[0];
        open(file_path);
    }
    ```

If you run the code in the second cell, you will see that all files will open!
