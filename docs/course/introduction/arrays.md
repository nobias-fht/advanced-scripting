# Arrays

Arrays a specialized data structures that hold a list of elements. For example, the following sequence is an array consisting of the numbers one through ten:

```java
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Arrays are particularly important to us because images are just two-dimensional arrays of numbers.

For example, the following is a two-dimensional array, but we can also visualize it as an image, with the values mapping to intensity levels in the final image

Unfortunately, in ImageJ macro, we cannot simply initialize an array as we would with any other variable. Instead, to initialize an array in `ImageJ Macro`, we use the following syntax:

```java
//initialize a new empty array of length 10
my_array1 = newArray(10);

//initialize a new array with the following three elements
my_array2 = newArray("element1", "element2", "element3");
```



We can `index` arrays to determine what values are in them. The simplest form of indexing is asking what the value is at a particular point in the array. Remember that arrays are 0-indexed, meaning the first value is at the 0th position, not the first. To index, we use the following syntax:

```java
array[position]
```

For example, if we wanted the first position of `my_array2` we would type the following:

```java
print(my_array2[0])
```





- array
- indexing
- arrays of strings or numbers
