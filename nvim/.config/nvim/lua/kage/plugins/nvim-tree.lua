return {
   "nvim-tree/nvim-tree.lua",

   dependencies = { {"nvim-tree/nvim-web-devicons"},{'b0o/nvim-tree-preview.lua'} }, --this is dependency in the documentation
   config = function()
      local nvimtree = require("nvim-tree")

      -- This sets the relitive number on the left and the width
      nvimtree.setup({
         view = {
            width = 38,
            relativenumber = true,
         },
         filters = {
            dotfiles = false,
         },
         git = {
            enable = true,
            ignore = false,
         }
      })

      -- ////////////// DEFINE KEYMAPS /////////////////////
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File Explorer" }) -- toggle file explorer
   end
}
