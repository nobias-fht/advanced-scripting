---
tags:
  - coding
  - arrays
---
# Strings

 A `string` is a data type that can store any text you might want. We have
 already seen strings before, for example "Hello World", and we have stored
 strings as variables before, for instance when we stored the `string` "This is
 also a variable" in the variable `message`:

 ```java
 message = "This is also a variable";
 ```

The ability to store and manipulate strings is a key part of `ImageJ Macro`
programming, so let's take a close looks. :mag_right:

We can create a string in the same way we create any other variable, but picking
a name and assigning a value to it. In the case of strings, the value must be
enclosed in quotation marks `"`. :warning:

 ```java
 message = "This is a string";
 message = This is not a string;
 ```

We can combine two strings using the `+` operator, for example:

```java
string1 = "This is "; // (1)!
string2 = "a string";
string3 = string1 + string2;
print(string3);

```

1. Remember that we need a space either at the end of the first string or at the
beginning of the second string, or else the concatenation will be "This isa
String"

We can also include other variables in a string, for example:

```java
number = 42;
string = "My favorite number is " + number;
print(string);
```

Strings can be split at various points. This is very useful for, as an example,
removing file extensions (such as `.tif` from file names). :collision:

If we had the following string: `myfile.tif` and wanted to get only the file
name, we could `split` the string at the `.`.

```javascript
string = "myfile.tif";
split_string = split(string, '.');
print(split_string[0]+", "+split_string[1]);
```

The `split` function returns an array which contains the split strings. In this
case, the array would contain the values `myfile` and `tif` (because we have
chosen to split the string at the `.`). :rocket:
