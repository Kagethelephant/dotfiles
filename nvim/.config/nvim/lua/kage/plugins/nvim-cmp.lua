return {
   -- //////////////////// LINKS CMP TO LSP ///////////////////////// 
   {
      "hrsh7th/cmp-nvim-lsp"
   },

   -- //////////////////// SNIPPET SERVER ///////////////////////// 
   -- This handles the controls for completing parameters, in autocompleted functions
   {
      "L3MON4D3/LuaSnip",
      dependencies = {
         "saadparwaiz1/cmp_luasnip",
         "rafamadriz/friendly-snippets",
      },
   },
   -- -- //////////////////// SIGNATURE HELP ///////////////////////// 
   -- {
   --    "ray-x/lsp_signature.nvim",
   --    event = "InsertEnter",

   --    config = function()
   --       local signature = require("lsp_signature")

   --       vim.keymap.set({"n","i"}, '<C-k>', function() signature.toggle_float_win() end, { silent = true, noremap = true, desc = 'toggle signature' })
   --       signature.setup({

   --          bind = true,
   --          handler_opts = {
   --             border = "rounded"
   --          },
   --       })
   --    end
   -- },
   -- //////////////////// NVIM-CMP ///////////////////////// 
   {
      "hrsh7th/nvim-cmp",
      config = function()
         require("luasnip.loaders.from_vscode").lazy_load()
         local cmp = require("cmp")
         local ls = require("luasnip")

         -- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
         vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
         vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

         cmp.setup({

            -- ************ SNIPPET SOURCE *************
            snippet = {
               expand = function(args)
                  require("luasnip").lsp_expand(args.body)
               end,
            },

            -- ************ WINDOW OPTION *************
            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },

            -- ************ KEYMAPS *************
            mapping = cmp.mapping.preset.insert({
               ["<C-k>"] = cmp.mapping.select_prev_item(),
               ["<C-j>"] = cmp.mapping.select_next_item(),
               ["<C-Space>"] = cmp.mapping.complete(),
               ["<C-e>"] = cmp.mapping.abort(),
               ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({

               {-- ******** FILTERS OUT TEXT SUGGESTIONS **********
                  name = "nvim_lsp",
                  entry_filter = function(entry)
                     return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                  end
               },
               -- ************ FILE PATHS *************
               { name = "path"}, -- 
            }),


         })
      end,
   },
}
