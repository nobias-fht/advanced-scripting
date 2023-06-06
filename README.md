<p align="center">
    <img src="https://github.com/nobias-fht/.github/blob/main/images/banner_nobgd.png?raw=true">
</p>

# Welcome

Welcome to the advanced scripting with ImageJ macros from the NoBIAS facility of the Human Technopole. The website can 
be found [here](https://nobias-fht.github.io/advanced-scripting/).

## How to run this site locally

1. Clone this repository

    ```bash
    git clone https://github.com/nobias-fht/advanced-scripting.git
    ```

2. In a conda env, install the relevant packages:

    ```bash
    pip install -r requirements.txt
    ```

3. Install the commit pre-hooks

    ```bash
    pip install pre-commit
    pre-commit install
    ```

4. Then generate the site:

    ```bash
    mkdocs serve
    ```
