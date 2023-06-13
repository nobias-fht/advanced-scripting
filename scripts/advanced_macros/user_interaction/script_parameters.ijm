/*
* A script demonstrating the use of ImgeJ2 parameters.
*
* License: BSD 3-Clause
*/

#@ Integer (label="Number", min=0, max=10, value=5) int1
#@ Double (value=0.0123, persist=false, style="format:#.00") float1
#@ String (visibility=MESSAGE, value="Set more parameters", required=false) msg
#@ String (choices={"Oui", "Non"}, style="listBox") yesOrNo
#@ File (label="Select a file") myFile
#@output String myString

myString = "I am super happy to have " + int1 + " and " + yesOrNo + " (about " + float1 + ").";
myString += " Oh, and the file is: " + myFile;
