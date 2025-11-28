return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      local ls = require("luasnip")

      -- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }),
      sources = cmp.config.sources({

         {-- ******** THIS FILTERS OUT TEXT SUGGESTIONS **********
            name = "nvim_lsp",
            entry_filter = function(entry)
               return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
            end
         },

         -- ************ THIS SHOWS FILE PATHS *************
         { name = "path"}, -- 

      }),
        -- sources = cmp.config.sources({
        --   { name = "nvim_lsp" },
        --   { name = "luasnip" }, -- For luasnip users.
        -- }, {
        --   { name = "buffer" },
        -- }),
      })
    end,
  },
}



-- return {
--    {
--       -- This is including the LSP completion source used below
--       "hrsh7th/cmp-nvim-lsp",
--    },
--    {
--       "hrsh7th/nvim-cmp",
--       dependencies = {"hrsh7th/cmp-path","VonHeikemen/lsp-zero.nvim"}, -- Allows the LSP to look for files paths on your pc

--       -- CONFIGURE CMP
--       config = function()
--          local cmp = require("cmp")
--          local cmp_action = require('lsp-zero').cmp_action()
--          cmp.setup({

--             -- WINDOW CONFIGURATION
--             window = {
--                completion = cmp.config.window.bordered(),
--                documentation = cmp.config.window.bordered(),
--             },

--             -- KEY MAPPINGS
--             mapping = cmp.mapping.preset.insert({
--                -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--                -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
--                -- ['<C-Space>'] = cmp.mapping.complete(),
--                -- ['<C-e>'] = cmp.mapping.abort(),
--                ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--             }),


--             -- COMPLETION SOURCES
--             sources = cmp.config.sources({

--                {-- ******** THIS FILTERS OUT TEXT SUGGESTIONS **********
--                   name = "nvim_lsp",
--                   entry_filter = function(entry, ctx)
--                      return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
--                   end
--                },

--                -- ************ THIS SHOWS FILE PATHS *************
--                { name = "path"}, -- 

--             }),
--          })
--       end,
--    }
-- }
