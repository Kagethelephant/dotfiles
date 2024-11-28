return {
  "sho-87/kanagawa-paper.nvim", -- we can load more than one theme here to have options
  priority = 1000, -- Loads before anything
  config = function()
    -- -- This is how we change the colors (idk where to get the naming convention)
    -- local bg_color = #FFFFFF
    -- require("kanagawa-paper").setup({
    --   style = "style",
    --   on_colors = function(colors)
    --      color.bg_color = #FFFFFF
    --   end
    -- })
    vim.o.background = "dark" -- Set to the dark version of the theme
    vim.cmd.colorscheme "kanagawa-paper" -- Set the color scheme in vim
  end
}
