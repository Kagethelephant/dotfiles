return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  -- dependencies = {"windwp/nvim-ts-autotag",}, -- This is so treesitter can give us autoclosing

  config = function()
    -- grab a handle on the treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      -- enable syntax highlighting
      highlight = {enable = true,},
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      -- autotag = { enable = true },
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
      },
      -- You can add some internal keymappings here for navigating nodes (see documentation)
    })

    -- Create a keymap to view the treesitter map
    -- There are a lot more options but this is all ive been using
    vim.keymap.set("n", "<leader>m", "<cmd>InspectTree<cr>", { desc = "TreeSitter Map" })
  end,
}
