---
tags:
  - exercises
  - debugging
---
# Debugging exercise

Debugging is the process of spending hours finding a typo that can be
corrected in 0.1 s. Annoying, but unavoidable. :bug:

Better be prepared then! :muscle:

!!!Question
    Find the errors in the following macro:

    ```javascript title="A buggy macro"
    // Starting value
    number = 0;

    // Add the sum of all odd values up to 9
    for (i = 0; i < 9; i++) {
        // increase number only if i is odd
        if(i % 2 != 1){
            number += i
        }
    }

    // Create a string and print
    string = "The number is " + number + ".";
    print(string)

    // The number should be 25
    ```
