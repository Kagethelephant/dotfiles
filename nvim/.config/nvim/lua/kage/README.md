# Lazy NVIM configuration


## Plugin Descriptions

Most of the plugins installed will be commented pretty well so open the each of the Lua files to see what is happening under the hood

### Alpha
This is just a nice looking splash screen for when you open up NVIM

### Autopairs
This will auto-close the parenthesis and whatnot

### Cmake
This just includes some functions for cmake to make configuring and building cmake easier

### Colorizer
This will create little color swatches from color codes in most languages

### Colorscheme
This has some color-schemes imported from github. I am importing multiple themes and only setting one, This way i can select the themes with the theme selecter build into NVIM and decide what one i want to use as the default

### Comment
This would normally enable commenting but NVIM has this feature by default now. This is still used for complex commenting in JSX though. The code was coppied and pasted so all of the config might not be necessary

### GitSigns
This will give you git indicators in the left column next to the line number

### Indent blackline
This will give you a vertical line to visualise the indent scope

### lsp-config
This contains the setup for mason LSPs and the built in NVIM-LSP to display the lsp warnings and errors

### LuaLine
This changes the status bar at the bottom to look better (can be configured to do cool stuff)

### Misc
Just some stuff that someone recommended to put in because it is required by a lot of plugins

### nvim-cmp
This give autocompletion capabilities with the drop down list. This uses LSP stuff to fill in the info

### nvim-tree
This is a file explorer built straight into nvim

### Telescope 
This allows us to look up stuff with fuzzy finding, files, strings, etc.

### Treesitter
This uses LSP information to determine the scope of variables and stuff of the like. Very powerful and probably need to learn how to better use this

### Which-Key
This is a little menu that pops up when you press the leader key (SPACE) to show you what commands you have mapped



## General

The core folder will have some general NVIM configuration stuff while the Plugins folder has all of the add-ons. These could all exist in the same Lua file but this would get messy really quick.

## Notes

You can use fff instead of treesitter by installing fff and using toggleterm to launch fff instead of the terminal with a different key. fff might be a better file manager and i think this is worth considering.


