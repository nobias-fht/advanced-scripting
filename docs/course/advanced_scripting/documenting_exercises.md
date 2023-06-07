---
tags:
  - exercise
  - documenting
  - comments
---
# Documenting exercise

!!!Question
    Document and comment the following macro:

    - Understand the functions and write a small comment describing what they do.
    - Add some empty lines to make the code more readable in the last block.
    - Add comments for the different steps of the last blocks.
    - Finally, add a macro description at the top of the script.

    *Note*: Don't over do it, just think what would be interesting to
    write and make it short. :muscle:

    ```javascript title="Uncommented macro"
    path = "C:\\Users\\Margot\\Desktop\\projects\\20230612\\imaging_confocal";

    function indexInArray( array, value ) {
        for (i=0; i<array.length; i++) {
            if ( array[i] == value ) {
                return i;
            }
        }
        return -1;
    }


    function getMonth(month){
        if (month == "01"){
            return "January";
        } else if(month == "02"){
            return "February";
        } else if(month == "03"){
            return "March";
        } else if(month == "04"){
            return "April";
        } else if(month == "05"){
            return "May";
        } else if(month == "06"){
            return "June";
        } else if(month == "07"){
            return "July";
        } else if(month == "08"){
            return "August";
        } else if(month == "09"){
            return "September";
        } else if(month == "10"){
            return "October";
        } else if(month == "11"){
            return "November";
        } else if(month == "12"){
            return "December";
        } else {
            return "Invalid month";
        }
    }

    function prettyDate(day, month, year){
        prettyMonth = getMonth(month);

        print("The experiment was performed on the "+day+"th of "+prettyMonth+" of "+year+".");
    }


    folders = split(path, "\\");
    index_project = indexInArray(folders, "projects");
    date = folders[index_project+1];
    year = substring(date, 0, 4);
    month = substring(date, 4, 6);
    day = substring(date, 6, 8);
    prettyDate(day, month, year);
    ```
