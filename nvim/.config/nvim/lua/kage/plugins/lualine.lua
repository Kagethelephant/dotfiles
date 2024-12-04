return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "tinted-theming/base16-vim" },

    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count

      -- You can put some stuff in here to custimize LuaLine
      lualine.setup({
        options = { theme = "everforest" }
      })
    end,
  },
}
