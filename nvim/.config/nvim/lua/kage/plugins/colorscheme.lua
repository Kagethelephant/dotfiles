-- This is setup to load multiple themes and 
-- select one as the default by uncommenting the 
-- config function
-- You can use ":Telescope colorscheme" for a live preview
-- if that is setup in the telescope settingd

return {
  {
    "tinted-theming/tinted-vim",
    priority = 1000,

    config = function ()
      -- local theme = "base16-everforest-dark-hard"
      -- local theme = "base16-classic-dark"
      -- local theme = "base16-brushtrees"
      -- local theme = "base16-ashes"
      local theme = "base16-mountain"
      vim.o.background = "dark"
      vim.cmd.colorscheme(theme)
    end
  },
  {
    "vague2k/vague.nvim",
    priority = 1000,

    -- config = function ()
    --   local theme = "vauge"
    --   vim.o.background = "dark"
    --   vim.cmd.colorscheme(theme)
    -- end
  },
}
