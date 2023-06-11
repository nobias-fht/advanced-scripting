---
tags:
  - coding
  - arrays
---
# Arrays

Arrays are specialized data structures that hold a list of elements. For
example, the following sequence is an array consisting of the numbers one
through ten:

```javascript title="An array"
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Of course, an array doesn't only have to hold numbers. We can for example make
an array of words, for example:

```javascript title="Also an array"
["this", "is", "also", "an", "array"]
```

## Macro arrays

!!!Warning
    In the ImageJ macro language, arrays are only one-dimensional, which
    means that we cannot represent images as arrays (as opposed to most
    programming languages). :thumbs_down:

    Images are, however, represented as...

    ... `Image`. :tada:

Unfortunately, in ImageJ macro, we cannot simply initialize an array as we
would with any other variable. Instead, to initialize an array in
`ImageJ Macro`, we use the following syntax:

```javascript title="Initialize an array"
//initialize a new empty array of length 10
my_array1 = newArray(10);

//initialize a new array with the following three elements
my_string_array = newArray("element1", "element2", "element3");
```

## Accessing values in the array

We can `index` arrays to determine what values are in them. The simplest form
of indexing is asking what the value is at a particular point in the array.
Remember that arrays are 0-indexed, meaning the first value is at the `0`
position, not at `1`. :fearful:

To index, we use the following syntax:

```javascript title="Access array value"
array[position];
```

For example, if we wanted the first position of `my_string_array` we would type
the following:

```javascript title="Get first member"
print(my_string_array[0]);
```
