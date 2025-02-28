return {
   {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons", "tinted-theming/base16-vim" },

      config = function()
         local lualine = require("lualine")
         local lazy_status = require("lazy.status") -- to configure lazy pending updates count

         -- You can put some stuff in here to custimize LuaLine
         lualine.setup({
            options = {
               theme = "auto",

            },
            sections = {
               lualine_a = {'mode'},
               lualine_b = {'branch'}, -- 'diff','diagnostics' was here by default
               lualine_c = {'diagnostics'},-- 'filename' was here
               lualine_x = {},-- 'filetype','encoding', 'fileformat', was here
               lualine_y = {'filename'}, -- 'progress' was here
               lualine_z = {'location'}
            },
            inactive_sections = {
               lualine_a = {},
               lualine_b = {},
               lualine_c = {'filename'},
               lualine_x = {'location'},
               lualine_y = {},
               lualine_z = {}
            },
         })
      end,
   },
}
