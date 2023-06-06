#Writing to an external file

Right now we're just printing the coordinates at every frame. This is useful, but the log is not meant to be a place to store values. What we would really like to do is write these coordinates to a file, so that we can use them later.

The way we write to a file in ImageJ macro is using the `print` command. We've already seen this when we're printing to the console. To print to a file, we just have to tell it what file to print to as an additional argument to `print()`.

```javascript
print(filemame, "string to print");
```

If the `filename` does not exist, imageJ will create it.

Try writing 


