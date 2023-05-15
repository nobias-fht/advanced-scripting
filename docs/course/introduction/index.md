# Introduction to Programming

In this section, we will go through the basics of scripting using the `ImageJ
Macro` language, as well as some basic concepts in programmimg.

Programming is just a way of telling a computer what you want it to do. However, computers are not very smart, so we have to be very precise in how we tell them what to do.

We interact with a computer by using specific commands, each of which gives the computer one or more specific instructions.

Let's write our first program -- Ready? On your mark, get set, go!

A very simple program is often called "Hello World". Here all we are asking the computer to do is print the phrase "Hello World".

Open the ImageJ editor by selecting from the menu bar "Plugins -> New -> Macro.
In this window, type the following:

```java title=""

print("Hello World");

```

You should see a window titled "Log" appear with the words "Hello World" printed in it. Congratulations, you've written your first computer program!

It's worth taking a moment and understanding what is going on here.

First, we've told the computer  we would like to do (`print` something). This is called a `function` and we will see many  more of these as we progress through the course.

Second, we've told the computer what we would like it to print (in this case the string `Hello World`). This is called an `argument` and it gives the function a specific piece of information that it needs.

Lastly, we want to tell the computer "OK, we're done giving you instructions, you can go ahead and do what we told you to do". In the ImageJ macro language, we do this by placing the `;` symbol at the end of the line. This is very important, and in fact, if you forget to do this, your code will fail.


!!! note "Don't Panic!"
    Don't worry about typing the wrong thing and making an error. The worst case-scenerio is that you will have to force your script to stop running. So don't be afraid of trying things and seeing what works (and what doesn't!). An important part of learning to program is learning from your mistakes!


Of couse, we want to do more with our programs than printing out cute messages. In the next section we will learn how we can store and manipulate infomation using `variables`.





<!---
Add some visual flair
--->
