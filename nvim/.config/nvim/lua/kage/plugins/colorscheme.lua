return {
  {
    "sho-87/kanagawa-paper.nvim",
    priority = 1000,
    config = function ()
      local theme = 'kanagawa-paper'
      vim.o.background = "dark"
      -- vim.cmd.colorscheme(theme)
    end
  },
  {
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    config = function ()
      local theme = 'nordic'
      vim.o.background = "dark"
      -- vim.cmd.colorscheme(theme)
    end
  },
  {
    "cocopon/iceberg.vim",
    priority = 1000,
    config = function ()
      local theme = 'iceberg'
      vim.o.background = "dark"
      -- vim.cmd.colorscheme(theme)
    end
  },
  {
    "lvim-tech/lvim-colorscheme",
    priority = 1000,
    config = function ()
      local theme = 'lvim'
      vim.o.background = "dark"
      -- vim.cmd.colorscheme(theme)
    end
  },
  {
    "vague2k/vague.nvim",
    priority = 1000,
    config = function ()

      local theme = "vague"
      require("vague").setup({
        transparent = false, -- don't set background
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "italic",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "italic",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        -- Override colors
        colors = {
          bg = "#18191a", --
          fg = "#cdcdcd",
          floatBorder = "#878787",
          line = "#282830",
          comment = "#465362",--"#646477",
          builtin = "#bad1ce",
          func = "#be8c8c",
          string = "#deb896",
          number = "#d2a374",
          property = "#c7c7d4",
          constant = "#b4b4ce",
          parameter = "#b9a3ba",
          visual = "#363738",
          error = "#d2788c",
          warning = "#e6be8c",
          hint = "#8ca0dc",
          operator = "#96a3b2",
          keyword = "#7894ab",
          type = "#a1b3b9",
          search = "#465362",
          plus = "#8faf77",
          delta = "#e6be8c",
        }
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme(theme)
    end
  },
}
