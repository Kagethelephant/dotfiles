return {
   -- This is to settup contextual commenting, nvim has build in commenting now but
   -- I could not figure out how to integrate ts_context_comment string with it. 
   -- ts_context_comment string enable contextual commenting so it can comment html bits in
   -- reactjs correctly and the javascript bits correctly
   "numToStr/Comment.nvim",
   config = function()
      local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup({
         padding = true,
         sticky = true,
         ignore = "^$",
         toggler = {
            line = "gcc",
            block = "gbc",
         },
         opleader = {
            line = "gc",
            block = "gb",
         },
         extra = {
            above = "gcO",
            below = "gco",
            eol = "gcA",
         },
         mappings = {
            basic = true,
            extra = true,
            extended = false,
         },
         pre_hook = prehook,
         post_hook = nil,
      })
   end,
   event = "BufReadPre",
   lazy = false,
   dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
   },
}
