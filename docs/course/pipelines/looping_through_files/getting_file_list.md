---
tags:
  - pipeline
  - files
---
# Getting a list of files

First, we need to get a list of all the files in the input folder so that we can
process them one at a time. For this, we will use the function `getFileList()`.

```javascript
folder = "path/to/file";
file_list = getFileList(folder);
```

!!!Important
    The function `getFileList` is not that well named, since it actually
    returns...

    ...an array. :scream:

    There are no list objects in the ImageJ macro. We will use list and array
    as synonyms.

The syntax here should be familiar to you, but let's think about what we're
doing here and refresh our memory. We're using a function, `getFileList`, and
passing in the value of the folder in which we have our images stored (in this
case, `path/to/file`, which we are storing in the variable `folder`). Under the
hood, this function is going to look at this folder, and return an array of
files that are contained within it. :thinking:

We can then store it in a variable, in order to use it later in our script. :wink:

??? tip "Variable Names"
    Remember that variable names should be clear and understandable. There was
    nothing stopping us from using the variable name `dz334ldkx` to store this
    file list, but we would have no idea later on in our code what that refers
    to. So, it's good practice to use names that are descriptive of what the
    variable is storing.

Let's take a look at what's stored in our `file_list` variable. Because it's an
array, we need to use the special command to print it.

```javascript
Array.print(file_list)
```

The output should look something like

`normal_0.tif, normal_1.tif, normal_2.tif, normal_3.tif, normal_4.tif, normal_5.tif, normal_6.tif, normal_7.tif, normal_8.tif, normal_9.tif`

!!!question
    How can we loop through our list of files?
