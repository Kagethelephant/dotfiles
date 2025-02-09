return {
  {
    -- This is including the LSP completion source used below
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-path",}, -- Allows the LSP to look for files paths on your pc

    -- CONFIGURE CMP
    config = function()
      local cmp = require("cmp")
      cmp.setup({

        -- WINDOW CONFIGURATION
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        -- KEY MAPPINGS
        mapping = cmp.mapping.preset.insert({
          -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
          -- ['<C-Space>'] = cmp.mapping.complete(),
          -- ['<C-e>'] = cmp.mapping.abort(),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),


        -- COMPLETION SOURCES
        sources = cmp.config.sources({

          {-- ******** THIS FILTERS OUT TEXT SUGGESTIONS **********
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
                return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end
          },

          -- ************ THIS SHOWS FILE PATHS *************
          { name = "path"}, -- 

        }),
      })
    end,
  }
}
