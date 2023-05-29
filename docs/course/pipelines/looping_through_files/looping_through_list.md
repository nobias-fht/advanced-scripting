# Looping Through a List

A list is similar to an array, in that it can be indexed. In fact, it is indexed in exactly the same way (file_list[0], for the first element, file_list[1] for the second, and so on).

Let's first check how we could access one file in this list.

??? Question "Write code to print the fifth filename in side `file_list`"
    ```javascript
    print(file_list[4])
    ```

If you run this, you should see output in the log that looks like `normal_5.tif`. To go through all the files,  we could now write a loop that goes through each element of the list on by one, replacing the number in the square brackets `[]` every iteration.



Remember that we write a loop using the `for` keyword. You can refer back to the 'loops' section of the introduction if you don't remember exactly how this works. In our folder, we have 10 files. So, we should loop through the list 10 times. Let's try just printing the names, first

```javascript
for (i=0; i<10; i++)
    {
        print(file_list[i])
    }

```
You should see the names of the files printed one by one in the log.

??? Question "Can you think of a problem with this?"
    In this case, we have 10 images in the folder. What would happen if, in another folder, we had only 8 images? This is an example of 'hard-coding` something that should really be a variable, and it's generally bad practice. Remember that we are trying to build scripts that are generalizable. We don't want a script that we have to modify the code for every time we have a different number of images. In the next section we will fix this problem.
