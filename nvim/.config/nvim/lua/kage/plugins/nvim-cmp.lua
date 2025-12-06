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
         })
      end,
   },
}
