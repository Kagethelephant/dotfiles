return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- Settings
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 10000
  end,
}
