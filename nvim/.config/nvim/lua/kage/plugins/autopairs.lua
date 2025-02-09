return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Lazy Load first time entering insert mode
  dependencies = { "hrsh7th/nvim-cmp", }, -- Load nvim cmp in as dependency

  config = function()
    -- Create a handle for the plugin
    local autopairs = require("nvim-autopairs")

    -- Configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
    })

    -- Import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    -- Import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")
    -- Make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
