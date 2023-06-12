---
tags:
  - intro
---
# Looping through files

In the folder called `looping_through_files`, you will find a series of images.
The purpose of this tutorial is to apply a simple filter to each of these files.

!!! Note
    The data is from [Kromp et al, 2020, "An annotated fluorescence image dataset for training nuclear segmentation methods"](https://www.nature.com/articles/s41597-020-00608-w).

!!! info "Learning Objectives"

    * Learn how to get a list of files in a folder :card_index_dividers:
    * Learn how to open each file individually :open_file_folder:
    * Learn how to manipulate files once opened by a script :scroll:
    * Learn how to save and close files :floppy_disk:

??? note "Other approaches"
    There are other ways of approaching this problem than the one we will
    demonstrate here. For example, we could use the Fiji batch processing
    interface. Or, we could open all the images and iterate through all the
    open windows. However this method, while a little more complicated, is more
    flexible and will be of more use down the road a we build more complicated
    pipelines.
