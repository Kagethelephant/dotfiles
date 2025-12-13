# VIM COMMANDS

## ACCESSIBILITY
- `:set wrap!` will toggle wrap
- `<space>+w` will toggle wrap (added keymap)

## TERMINAL
- Ctrl+` to toggle terminal

## SELECT
- `V` to select lines 
- `ctrl+v` to select blocks
- `ctrl+l` next parameter when filling out autocompletion function
- `ctrl+j` last parameter when filling out autocompletion function

## MODIFICATION
- `zg` add spelling mistake under cursor to the dictionary
- `zw` remove word under the cursor from the dictionary
- `]s` next spelling mistake
- `[s` last spelling mistake
- `.` will repeat the last thing you did in insert mode
- `gc` will toggle comment but I'm not sure what plugin is doing this
- `gcc` will do the same thing on cursor
- `(ctrl + U)` will let you enter unicode characters like this silly little guy §
- `(U)` will UNDO and 
- `(ctrl + r)` will REDO
- `=` will indent highlighted area correctly
- `>>` and `<<` will indent and unindent line
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
- `b` to skip to beginning of word
- `e` to skip to end of word

- `i` will insert before the cursor
- `a` will insert after the cursor
- `I` insert at the beginning of the line
- `A` insert at the end of the line

- `0` will place the cursor at the beginning of the line
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

- `Ctrl+w` and `hjkl` will change from one split to another (including the explorer)
- `Ctrl+w` and `-/+` or `</>`will change the size of the current split
- `Ctrl+w` and `=` will equalize the splits


## NVIM-TREE
- `Space+e` open explorer
- `m` to mark
- `bd` to delete marked files
- `r` to rename
- `d` to delete
- `bmv` to move marked items to cursor location
- `Ctrl+x` will open the document in a horizontal split
- `Ctrl+v` will open the document in a vertical split
- `Ctrl+t` will open the document in a new tab
- `H` will toggle show dotfiles
- `I` will toggle gitignore files



