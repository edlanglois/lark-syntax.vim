lark-syntax.vim
===============
Attempts to support most syntax in a 
[lark grammar file](https://github.com/lark-parser/lark).

install
-------
I've only tested this with [vim-plug](https://github.com/junegunn/vim-plug)


unsupported syntax
------------------
Currently unsupported syntax that I'm aware of:

- using '|' in terminal productions (use regex)
- range literal (use regex)

hardcoded colors
----------------
vim highlighting colors are hardcoded right now. they should eventually get 
linked to builtin highlighting types (like `Keyword`)

