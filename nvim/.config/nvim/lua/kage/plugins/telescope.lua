return {
  {
  -- !!! You need to install ripgep for the find string to work
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",

  dependencies = {
    {"nvim-lua/plenary.nvim"},
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, --Improves sorting performance
    {"nvim-tree/nvim-web-devicons"},
  },
  config = function()
    -- This is where we include the modules we will be fucking with
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- This improves the sorting performance
    telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
