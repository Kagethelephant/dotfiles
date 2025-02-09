return {
  -- //////////////////// MASON /////////////////////////
  { -- Install mason
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },


  -- //////////////////// MASON-LSPCONFIG ///////////////////////// 
  { -- This is the Mason LSP config to configure the mason lsp settings and bridges gap to nvim-lspconfig
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({

        -- Make sure Mason installs all of these servers
        ensure_installed = {
          "bashls", -- Bash server
          "lua_ls", -- Lua server
          "clangd", -- C++ server
          "ts_ls", -- Javascript and Typescript server
          "html",  -- HTML server
          "cssls", --CSS sercver
          "cmake",  -- Cmake server
          "jsonls", -- JSON server
          "pylsp",  -- Python server
          "tailwindcss" --tailwind server
        }
      })
    end
  },


  -- //////////////////// NVIM-LSPCONFIG /////////////////////////
  { -- Calling setup for the given LSP here will link the LSP to nvim
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")
      -- import mason_lspconfig plugin
      local mason_lspconfig = require("mason-lspconfig")
      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")



        --********* SET KEYBINDINGS ***********

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function()

          -- set keybinds
          vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = 'Show References' }) -- show definition, references

          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code Actions' }) -- see available code actions, in visual mode will apply to selection

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Smart Rename' }) -- smart rename

          vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = 'Show Buffer Diagnostics' }) -- show  diagnostics for file

          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = 'Show Line Diagnostics' }) -- show diagnostics for line

          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' }) -- jump to previous diagnostic in buffer

          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = 'Next Diagnostic' }) -- jump to next diagnostic in buffer

          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'Hover Documentation' }) -- show documentation for what is under cursor

        end,
      })


        --********* MAKE THE LSP RECOGNISE CMAKE PATHS ***********

      -- This will configure the LSP to look for the compile_commands.json file created by cmake. This will
      -- allow the lsp to recognize the include paths defined in cmake. cmake has to be configured to generate this file
      lspconfig.clangd.setup {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
      }


        --********* MAKE THE GIT SIGNS PRETTY ***********

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end



        --********* SETUP SERVERS ***********

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()
        -- default handler for installed servers
      mason_lspconfig.setup_handlers({

        -- This fixes a naming error with the tsserver
        function(server_name)
          if server_name == "tsserver" then
            server_name = "ts_ls"
          end

          -- load the server with the default capabilities defined above
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        --********* A SERVER CONFIG GOES HERE ***********

      })
    end,
  }
}
