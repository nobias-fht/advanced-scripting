---
tags:
  - exercises
  - functions
---
# Functions exercises

!!! question
    Write a function that takes two parameters, adds them together, and returns
    the result.

!!! question

    Write a function that takes an array, loops over the indices, multiplies
    together all array values and returns the result.

!!! question
    :warning: Advanced exercise :warning:

    Run the following macro and write down the final result. Then refactor the
    code into one or several functions to avoid code duplication.

    ```javascript title="Macro with duplication"
    array1 = newArray(1, 34, 6, 21, 84, 14, 8);
    array2 = newArray(54, 24, 67, 28, 42, 2, 17);

    sum_array1 = 0
    for (i = 0; i < array1.length; i++) {
        sum_array1 += array1[i];
    }
    mean_array1 = sum_array1 / array1.length;
    ratio = sum_array1 * sum_array1 / mean_array1;

    sum_array2 = 0
    for (i = 0; i < array2.length; i++) {
        sum_array2 += array2[i];
    }
    mean_array2 = sum_array2 / array2.length;
    ratio /= sum_array2 * sum_array2 / mean_array2;

    // It should print 0.7179
    print("Ratio: "+ratio);
    ```
