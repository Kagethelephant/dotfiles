# VIM COMMANDS
## SELECT
- `V` to select lines 
- `(ctrl+v)` to select blocks "this is a test for git"

## MODIFICATION
- `(ctrl + shift + u)` will let you enter unicode characters like this silly little guy §
- `(shft + U)` will UNDO and 
- `(ctrl + r)` will REDO
- `=` will indent highlighted area correctly
- TIP: if you enter Insert mode(by pressing `<Shift> I`) (or paste) with a block selection, enter a value, and hit escape it will copy the text on all selected lines

## REGISTERS
- `d` to cut/delete selection
- `D` to cut the line
- `y` to copy/yank selection
- `yy` to yank line 
- `P` to paste before cursor
- `p` to paste after
- `(" + *,+,1,2,3...)` will reference a register to copy and paste from using the above actions (+ = clipboard)

## NAVIGATION
- `b` to skip to begining of word
- `e` to skip to end of word

- `i` will insert before the cursor
- `a` will insert after the cursor
- `I` insert at the begining of the line
- `A` insert at the end of the line

- `0` will place the cursor at the begining of the line
- `$` will place the cursor at the end of the line

- `(ctrl + f)` will skip forward half a page
- `(ctrl + b)` will skip backward half a page
- `(ctrl + u)` will move cursor up half a page
- `(ctrl + d)` will move cursor down half a page

- `/` will start a search
- `<Space> + h` is what i mapped to clear the search
- `n` will go to the next item in the search

- `o` will create a return below and enter insert mode
- `O` will create a return above and enter insert mode


# PLUGINS
## UNKNOWN
- `gc` will toggle comment but im not sure what plugin is doing this
- `gcc` will do the same thing on cursor

## NVIM-TREE
- `m` to mark
- `r` to rename
- `d` to delete
- `bmv` to move marked items to cursor location
- `<SPACE>e'` to 


