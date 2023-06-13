---
tags:
  - pipeline
  - arrays
  - loops
---
# Looping Through an Array

Our list is an array, and we have seen earlier how arrays are indexed. Let's
first check how we could access one file in this list.

??? Question "How can we print the fifth element of `file_list`?"

    ```javascript
    print(file_list[4])
    ```

If you run this, you should see output in the log that looks like
`normal_5.tif`. To go through all the files, we could now write a loop that goes
through each element of the list on by one, replacing the number in the square
brackets `[]` every iteration.

Remember that we write a loop using the `for` keyword. You can refer back to
the 'loops' section of the introduction if you don't remember exactly how this
works. In our folder, we have 10 files. Let's try just printing the names:

```javascript
for (i=0; i<10; i++) {
  print(file_list[i]);
}
```

??? Question "Can you think of a problem with this?"
    In this case, we have 10 images in the folder. What would happen if, in
    another folder, we had only 8 images?

    This is an example of **hard-coding** something that should really be a
    variable, and it's generally bad practice. :fire:

    Remember that we are trying to build scripts that are generalizable. We
    don't want a script that we have to modify the code for every time we have
    a different number of images.

    In the next section we will fix this problem. :muscle:
