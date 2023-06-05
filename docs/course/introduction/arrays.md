# Arrays

Arrays a specialized data structures that hold a list of elements. For example, the following sequence is an array consisting of the numbers one through ten:

```javascript
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Of course, an array doesn't only have to hold numbers. We can for example make an array of words, for example:

```javascript
["this", "is", "also", "an", "array"]
```

Arrays are particularly important to us because images are just two-dimensional arrays of numbers.

For example, the following is a two-dimensional array, but we can also visualize it as an image, with the values mapping to intensity levels in the final image

```javascript
1	1	1	1	1	1	1	1
1	1	1	1	1	1	1	1
1	1	0	1	1	0	1	1
1	1	1	1	1	1	1	1
1	0	1	1	1	1	0	1
1	1	0 	0	0	0	1	1
1	1	1	1	1	1	1	1
1	1	1	1	1	1	1	1
```

You might be able to guess what this image is `:)`


Unfortunately, in ImageJ macro, we cannot simply initialize an array as we would with any other variable. Instead, to initialize an array in `ImageJ Macro`, we use the following syntax:

```javascript
//initialize a new empty array of length 10
my_array1 = newArray(10);

//initialize a new array with the following three elements
my_string_array = newArray("element1", "element2", "element3");
```

??? question "Try initializing some arrays or various types"


We can `index` arrays to determine what values are in them. The simplest form of indexing is asking what the value is at a particular point in the array. Remember that arrays are 0-indexed, meaning the first value is at the 0th position, not the first. To index, we use the following syntax:

```javascript
array[position]
```

For example, if we wanted the first position of `my_string_array` we would type the following:

```javascript
print(my_array2[0])
```

For a two dimensional array (like an image), we need two coordinates, representing the row and column of the pixel we would like to index. Remember, both of these are indexed from 0, starting from the top-left of the image.

??? question "Make an array consisting of the numbers between zero and ten. Write code to print the second, fifth, and eighth values. What do you expect these values to be?"
    ```javascript
        my_array = newArray("0", "1", "2", "3", "4", "5", "6", "7", "8', "9", 10"); //(1)!
        print(my_array[1])
        print(my_array[5])
        print(my_array[8])
    ```

    1. While this is a perfectly valid way of initializing array, it would be inefficient if we wanted to initialize an array of, say, 100 values. Look at the ImageJ macro docs and try to understand what the function `Array.getSequence()` does.



- arrays of strings or numbers
