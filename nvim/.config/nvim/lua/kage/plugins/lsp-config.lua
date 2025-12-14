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
               "marksman", -- Markdown lsp
               "clangd", -- C++ server
               "ts_ls", -- Javascript and Typescript server
               "html",  -- HTML server
               "cssls", --CSS sercver
               "neocmake",  -- Cmake server
               "jsonls", -- JSON server
               "pylsp",  -- Python server
               "tailwindcss", --tailwind server
               "glsl_analyzer" -- GLSL server (Opengl Shaders)
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

         --********* SET KEYBINDINGS ***********

         vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function()

               vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = 'Go to Definition', noremap = true, silent = true })

               vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = 'Show References' }) -- show definition, references

               vim.keymap.set({"n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code Actions' }) -- see available code actions, in visual mode will apply to selection

               vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Smart Rename' }) -- smart rename

               vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = 'Show Buffer Diagnostics' }) -- show  diagnostics for file

               vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = 'Show Line Diagnostics' }) -- show diagnostics for line

               vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' }) -- jump to previous diagnostic in buffer

               vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = 'Next Diagnostic' }) -- jump to next diagnostic in buffer

               vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'Hover Documentation' }) -- show documentation for what is under cursor

            end,
         })



         --********* MAKE THE DIAGNOSTIC SIGNS PRETTY ***********

         vim.diagnostic.config({
            signs = {
               text = {
                  [vim.diagnostic.severity.ERROR] = " ", -- Text for error signs
                  [vim.diagnostic.severity.WARN]  = " ", -- Text for warning signs
                  [vim.diagnostic.severity.INFO]  = " ", -- Text for info signs
                  [vim.diagnostic.severity.HINT]  = "󰠠 ", -- Text for hint signs
               }
            }
         })


         --********* SETUP SERVERS ***********

         -- -- Define the capabilities we will brodcast to the language servers (like auto completion)
         -- local capabilities = vim.tbl_deep_extend("force",
         --    vim.lsp.protocol.make_client_capabilities(), -- Broadcast diagnostic capabilities i think
         --    require("cmp_nvim_lsp").default_capabilities() -- Broadcast CMP capabilities to lsp
         -- )
         -- capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

         -- Get out autocompletion capabilities (seems to work the same as the above code)
         local capabilities = require('cmp_nvim_lsp').default_capabilities()

         -- advertise to every server the default capabilities defined above
         vim.lsp.config("*", {
            capabilities = capabilities,
         })

         -- Configure C++ language server for special setup
         vim.lsp.config("clangd", {
            -- Make the LSP look for CMake root directory
            root_markers = {"compile_commands.json", ".git"},
            -- This is supposed to fix the slow diag icons on clangd
            flags = { debounce_text_changes = 150 },
         })

         -- Configure the OpenGL server for special setup
         vim.lsp.config("glsl_analyzer", { -- Setup the custom extentions for GLSL
            filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
         })

         -- Enable all of the servers
         vim.lsp.enable("clangd")
         vim.lsp.enable("glsl_analyzer")
         vim.lsp.enable("neocmake")
         vim.lsp.enable("marksman")
         vim.lsp.enable("lua_ls")
         vim.lsp.enable("bashls")
         vim.lsp.enable("pylsp")
         vim.lsp.enable("html")
         vim.lsp.enable("jsonls")
         vim.lsp.enable("ts_ls")
         vim.lsp.enable("tailwindcss")
         vim.lsp.enable("cssls")
      end,
   }
}
