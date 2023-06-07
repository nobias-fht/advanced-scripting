---
tags:
  - coding
  - paths
---
# Advanced paths

Path to files are the single most hatred thing in programming. They are
responsible for a lot of bugs and probably entire blackouts in the US. The
latter be due to squirrels, but I am sure that paths are involved somehow. :squirrel:

What is the problem? :chipmunk:

Paths are defined differently depending on the operating system. For example,
the path to the `Documents` folder on Windows is `C:\Users\username\Documents`,
while on Linux it is `/home/username/Documents`. Can you see the most import
difference?

!!!Note
    There are two types of paths:

    - `absolute`: the path starts from the root of the file system.
    - `relative`: the path starts from the current working directory.

    Very often you will want to work with `relative` paths, as they are more
    flexible. For example, if you want to move your macro to another computer,
    you will not have to change the path to the files.

    But `relative` paths can be confusing!

    :warning: Some functions in ImageJ will only work with `absolute` paths.
    For example saving...

## Path separator

The path separator (`\` or `/`) is the character used to separate folders in a path. If you
want your macro to work on your colleagues' computers or the VDI at work, you
need to make sure that you use the correct path separator. :wink:

The best would be to make OS-agnotic paths, i.e. paths that work on any
operating system. To do so, you can use the `File.separator` variable.

```javascript title="OS-agnostic path"
print(File.separator);
relative_path = "MyExperiments"+File.separator+"TheOneThatWorked";
print(path);
```

## Home directory

ImageJ macro also includes ways to get the home directory of the user,
regardless of the OS:

```javascript title="Home directory"
getDirectory("home");
```
