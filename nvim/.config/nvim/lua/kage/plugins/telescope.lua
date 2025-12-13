return {
   -- !!! You need to install ripgep for the find string to work
   "nvim-telescope/telescope.nvim",
   branch = "0.1.x",

   dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make" }, --Improves sorting performance
      {"nvim-tree/nvim-web-devicons"},
      {"BurntSushi/ripgrep"},
      {"nvim-telescope/telescope-ui-select.nvim"}
   },
   config = function()
      -- This is where we include the modules we will be fucking with
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
         pickers = {
            -- Use telescope to find strings
            live_grep = {
               file_ignore_patterns = {
                  '.yarn*',
                  '.pki*',
                  '.vim*',
                  '.npm*',
                  '.viminfo*',
                  '.git*',
                  '.cache/*',
                  '.bash_*',
                  '.mozilla/*',
                  '.local/share/*',
                  '.bash*',
                  'node_modules',
                  '.git',
                  '.venv' },
               additional_args = function(_)
                  return { "--hidden" }
               end
            },
            -- Use telescope to find files
            find_files = {
               file_ignore_patterns = { 'node_modules', '.git', '.venv' },
               hidden = true
            },
            -- Use telesescope to preview themes
            -- you can use this by ":Telescope colorscheme"
            colorscheme = {
               enable_preview = true
            }

         },
         extensions = {
            "fzf",
            ["ui-select"] = {
               require("telescope.themes").get_dropdown {}
            },
         }
      })

      -- This improves the sorting performance
      telescope.load_extension("fzf")
      require("telescope").load_extension("ui-select")

      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
      vim.keymap.set("n", "<leader>ft", "<cmd>Telescope colorscheme<cr>", { desc = "Find theme from vim colorschemes with preview" })
   end,
}

