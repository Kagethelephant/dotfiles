-- for conciseness
local keymap = vim.keymap

-- set leader key to space
vim.g.mapleader = " "

-- clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear Highlights" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Wrap Text
keymap.set("n", "<leader>w", "<cmd>set wrap! %<CR>", { desc = "Toggle text wrap" }) --  move current buffer to new tab

-- Diferent keybinding for normal mode in terminal thats more natural
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
