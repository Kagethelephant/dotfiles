-- This is setup to load multiple themes and 
-- select one as the default by uncommenting the 
-- config function
-- You can use ":Telescope colorscheme" for a live preview
-- if that is setup in the telescope settingd

return {
   {
      -- I have been using base16 themes exclusively because they also match the theme with lualine
      -- you can preview themes with ":Telescope colorschemes" or shortcut "<space>ft"
      "tinted-theming/tinted-vim",
      priority = 1000,

      config = function ()
         -- local theme = "base16-oceanicnext" -- Medium, High contrast, very colorful
         -- local theme = "base16-gruvbox-light-medium" --Light, medium contrast, muted colors
         -- local theme = "base16-oxocarbon-light" -- Very Light, medium contrast, bright colors
         local theme = "base16-stella" -- Medium, medium contrast, bright soft colors
         -- local theme = "base16-rose-pine-moon" --Medium dark, medium contrast, bright colors
         -- local theme = "base16-sandcastle" --Medium dark, medium contrast, muted colors
         -- local theme = "base16-everforest-dark-medium" --Medium light, medium contrast, bright soft colors
         -- local theme = "base16-default-dark" --Medium Dark, medium contrast, bright colors
         -- local theme = "base16-kanagawa-dragon" -- Very Dark, high contrast, muted colors
         -- local theme = "base16-ashes" -- Medium, high contrast, muted colors
         -- local theme = "base16-mountain" -- Darkest, low contrast, muted colors
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
