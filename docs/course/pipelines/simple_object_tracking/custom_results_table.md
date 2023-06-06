#Writing to an external file

Right now we're just printing the coordinates at every frame. This is useful, but the log is not meant to be a place to store values. We can create a custom results table to store our x and y coordinates.


Let's make a new macro that initializes a custom results table.

```javascript
Table.create("xy_coordinates");
Table.setColumn("X_position");
Table.setColumn("Y_position");
```

Now we have a new table, which we can access using the Table variable. We used this already when we added th two columns `X_position` and `Y_position` to the table.

To add a row to the table, we use the following syntax

```javascript
Table.set("X_position", position, value);
```

What should we use as `position`? Since we are always wanting to add values to the end of our table, we can use `Table.size` to get the last row of the table. This is a very similar strategy to what we saw in the previous sectoin when we use the `length` of a List to find out the number of elements that it contains.

??? question modify your script so that, insread of printing the x and y coordiates to the log, it prints them to this custom results table, in the appropriate columns
   ```javascript
   macro "get_mouse_xy [g]" {
      getCursorLoc(x, y, z, modifiers)
      position = Table.size;
      Table.set("X_position", position, x);
      Table.set("Y_position", position, y);

         
        if (getSliceNumber + 1 < nSlices) { //(1)!
            setSlice(getSliceNumber + 1); 
        }
    }
   ```

??? question "uh-oh. Now when we write to the results window, our macro doesn't work anymore until we click into the image window again. Our window has lost `focus`. How can we automatically select the image window again?"
