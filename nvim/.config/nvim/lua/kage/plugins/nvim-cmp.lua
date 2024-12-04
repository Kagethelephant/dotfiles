return {
  {
    -- This is including the LSP completion source used below
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {"hrsh7th/cmp-path",},
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
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Commented this out to remove the enter functionallity
          -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          
          -- Kage: this will make the tab key complete the suggestions instead of enter
          ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              end
              cmp.confirm()
            else
              fallback()
            end
          end, {"i","s","c",}),
        }),
        -- COMPLETION SOURCES
        sources = cmp.config.sources({
          { name = "nvim_lsp",
            entry_filter = function(entry, ctx)
                return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end }, -- This will include the nvim_lsp source but filter out the text suggestions 
          { name = "path"}, -- 
          -- { name = "buffer"}, -- I think this gives text suggestions from the buffer
        }),
      })
    end,
  }
}
