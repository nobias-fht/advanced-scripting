# Demo

!!!Note
    This is a demo of the markdown syntax used in this documentation. It is not
    part of the site.

```python linenums="1"  title="my_file.py"
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2 * np.pi, 400) # (1)!
y = np.sin(x ** 2)
plt.plot(x, y)
plt.show()
```

1. This is a comment in the code block.

=== "C"

    ```c
    #include <stdio.h>

    int main(void) {
      printf("Hello world!\n");
      return 0;
    }
    ```

=== "C++"

    ```c++
    #include <iostream>

    int main(void) {
      std::cout << "Hello world!" << std::endl;
      return 0;
    }
    ```

<!---
See Admonitions:
https://squidfunk.github.io/mkdocs-material/reference/admonitions/#type:question
---->
??? info "Click to expand"
    `???` makes for collapsible content
??? warning "Click to expand"
    `???` makes for collapsible content
??? example "Click to expand"
    `???` makes for collapsible content
??? question "Click to expand"
    `???` makes for collapsible content
??? danger "Click to expand"
    `???` makes for collapsible content
