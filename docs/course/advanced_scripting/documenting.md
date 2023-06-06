---
tags:
  - coding
  - documenting
  - comments
---
# Documenting

Let's take a break from the hard stuff. :zzz:

Documenting your code is extremely important, especially once your macro start
to grow beyond human comprehension. :alien:

## Comments

We have already seen comments in the previous section. Comments should explain
what your code is doing, and why.

```javascript title="Example of a commented macro"
// (1)!
/*
 * This macro open images and applies Gaussian blur to each image.
 *
 * Some description on how to use the macro, where to put the images,
 * what type of images, etc.
 *
 * License: BSD-3 Clause
 * Authors: Fibula Borgmeister, Louis von Dibbelsdorf
 *          Humanoid Technopolis, 2023
 */

// (2)!
/*
 * Open all images inside a folder.
 *
 * Parameters
 * ----------
 * path : string
 *    Path to the folder containing the images.
 */
function open_images(path) {
    // do something
}

// (3)!
// Parameters used in the script
path_to_file = "path/to/file"; // path to folder containing the images
gaussian_blur_std = 5; // standard deviation of the Gaussian blur

// Load the images
open_images(path_to_file);
```

1. Macro description, with license and authors.
2. Function description, with parameters.
3. Sections, lines and variable descriptions.

!!!Note
    Comments allow others to use your code. Also very useful for future you,
    who will definitely not remember all the details! :sweat_smile:

    In addition, because ImageJ macro language is not typed, it is good
    practice to indicate what type of values to enter in the functions
    parameters.
