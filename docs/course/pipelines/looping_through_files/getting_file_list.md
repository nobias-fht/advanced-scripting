# Getting a list of files

First, we need to get a list of all the files in the input folder so that we can process them one at a time. For this, we will use the function `getFileList()`.


```javascript
folder = "XXX/XXX/XXX"
file_list = getFileList(folder); //(1)!
```

1. Functions are (usually!) clearly named. You can probably guess what this one does

The syntax here should be familiar to you, but let's think about what we're doing here and refresh our memory. We're using a function, `getFileList`, and passing in the value of the folder in which we have our images stored (in this case, `XXX`, which we are storing in the variable `folder`). Under the hood, this function is going to look at this folder, and return a list of files that are contained within it. Once it generates this 'file list' and returns it to us. What should we do with this list? So that we can use it later in our script, we will store it in a variable, in this case called `file_list`.

??? tip "Variable Names"
    Remember that variable names should be clear and understandable. There was nothing stopping us from using the variable name `dz334ldkx` to store this file list, but we would have no idea later on in our code what that refers to. So, it's good practice to use names that are descriptive of what the variable is storing.

Let's take a look at what's stored in our `file_list` variable. Because it's an Array, we need to use the special command to print it.

```javascript
Array.print(file_list)
```

The output should look something like

`normal_0.tif, normal_1.tif, normal_2.tif, normal_3.tif, normal_4.tif, normal_5.tif, normal_6.tif, normal_7.tif, normal_8.tif, normal_9.tif`

Now that we have our list of files, we can start to loop through it. How could we do this?

??? tip "Array Indexing"
    Remember that we can get individual elements from an array by using the array index. For example, to get the third element of this array, we would use file_list[2]
