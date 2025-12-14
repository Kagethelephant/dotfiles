return {
   "nvim-treesitter/nvim-treesitter",
   event = { "BufReadPre", "BufNewFile" },
   build = ":TSUpdate",

   config = function()
      -- grab a handle on the treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({
         -- enable syntax highlighting
         highlight = {
            enable = true,
            additional_vim_regex_highlighting = true
         },
         -- enable indentation
         indent = { enable = true },
         -- ensure these language parsers are installed
         ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "prisma",
            "markdown",
            "markdown_inline",
            "doxygen",
            "svelte",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "vimdoc",
            "c",
            "cpp",
            "comment"
         },
         auto_install = true,

         -- You can add some internal keymappings here for navigating nodes (see documentation)
      })

      -- Create a keymap to view the treesitter map
      -- There are a lot more options but this is all ive been using
      vim.keymap.set("n", "<leader>m", "<cmd>InspectTree<cr>", { desc = "TreeSitter Map" })
   end,
}
