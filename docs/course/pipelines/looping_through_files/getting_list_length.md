---
tags:
  - pipeline
  - arrays
---
# Using the Array.length function

How can we fix this problem? Wouldn't it be great if we could ask Fiji how many
files we have and just use that number? In this case, the number of files is
exactly equivalent to the length of the array. :thinking:

Each array in Fiji has a function attached to it called `length`, which returns
the length of the array.

```javascript
number_of_files = file_list.length; //(1)!
print(number_of_files);
```

1. Why this is not using the usual function syntax that we have seen before,
like getListLength(file_list) is beyond the scope of this course. It is enough
to understand that the syntax file_list.length returns the value of the length
of the array in the same way that a function like, say `getArrayLength(array)`
would.

Now that we know the length of the list, we can use it to tell the loop when to
stop:

```javascript
for (i=0; i<number_of_files; i++) {
  print(file_list[i]);
}
```

??? question "Why do we use `i<number_of_files` here, rather than `i<=number_of_files`?"

    Remember that arrays are indexed starting with 0. That is, the first element
    is at index 0, the second is at index 1, the third element is at index 2,
    and so on.

    This means that the last element of the list (10) is at index `length-1`,
    or index 9, which is where we want our loop to terminate. :wink:

In the next section, we will replace our "print" function with an "open file"
function.
