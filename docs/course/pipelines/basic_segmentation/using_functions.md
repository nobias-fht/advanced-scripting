#Writing clean code with Functions

In our macro, you can see that we have repeated lines of code. A fundamental paradigm of programming is DRY: Don't repeat yourself. Code that does not contain a lot of repeated lines is called "dry". Code that repeats a lot of lines is called "wet", and right now, our code is looking pretty wet.

But we can fix this by writing functions to do some of this processing that we know is going to happen on every image.

In our code, we're doing the same set of operations two our two channels: Renaming them, duplicating them, and then thresholding them. Let's write a function that does that all at once!

