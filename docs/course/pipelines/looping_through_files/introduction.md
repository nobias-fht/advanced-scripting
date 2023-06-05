# Looping through files


In the folder called XXX, you will find a series of images. The purpose of this tutorial is to apply a simple filter to each of these files. The dataset is from the following publication: <a  href=https://www.nature.com/articles/s41597-020-00608-w>  Kromp et al, 2020 An annotated fluorescence image dataset for training nuclear segmentation methods </a>

!!! info "Learning Objectives"
    * Learn how to get a list of files in a folder
    * Learn how to open each file individually
    * Learn how to manipulate files once opened by a script
    * Learn how to save and close files

??? note "Other approaches"
    There are other ways of approaching this problem than the one we will demonstrate here. For example, we could use the Fiji batch processing interface. Or, we could open all the images and iterate through all the open windows. However this method, while a little more complicated, is more flexible and will be of more use down the road a we build more complicated pipelines.
