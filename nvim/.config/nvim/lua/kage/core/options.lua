-- This will set VIM's default explorer to display in tree mode
vim.cmd("let g:netrw_liststyle = 3")

vim.diagnostic.config({
   virtual_text = false, -- This shows the diagnostic inline
   signs = true, -- This shows the signs on the side bar
   underline = false, -- Underlines the code in question
   update_in_insert = true, -- updates the errors on insert mode
   severity_sort = false,
})

-- -- Change the theme to the one in the local colors folder
--vim.cmd [[colorscheme kage]]

-- for conciceness
local opt = vim.opt

-- shows the relitive line numbers and shows the line of the cursor
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 3 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 3 -- 2 spaces for indent width (this should be the same as above)
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for complete color range (required for a lot of colorschemes to work)
opt.termguicolors = true

-- show sign column so that text doesn't shift (this is where LSP warning icons show up)
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
