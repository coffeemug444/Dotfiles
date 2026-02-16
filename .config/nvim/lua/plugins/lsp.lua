return {
   'neovim/nvim-lspconfig',
   dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
         library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
         },
      },
   },
   config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", '<leader>F', function()
         vim.lsp.buf.format({ async = false })
      end);
      vim.keymap.set("n", '<leader>gd', require('telescope.builtin').lsp_type_definitions, opts)
      vim.keymap.set("n", '<leader>gf', function()
         require('telescope.builtin').lsp_document_symbols({ symbols={'function', 'method'}})
      end, opts)
      vim.keymap.set("n", '<leader>gr', require('telescope.builtin').lsp_references, opts)
      vim.lsp.config("lua_ls", {
         settings = {
            Lua = {
               workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
               },
               telemetry = { enable = false },
            },
         },
      })
      -- to find names of lsp configs:
      -- :help lspconfig-all
      vim.lsp.enable({
         'bashls',
         'clangd',
         'lua_ls',
         'pylsp',
      })

      vim.diagnostic.config({
         virtual_text = false, -- shows messages inline
         signs = {
            severity = { min = vim.diagnostic.severity.ERROR },
         },
         underline = true, -- underlines problematic code
         update_in_insert = false,
         severity_sort = true,
         float = true,
      })
      vim.fn.sign_define("DiagnosticSignError", {
         text = "⛔",
         texthl = "DiagnosticSignError",
         numhl = "",
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
         pattern = { "*.cpp", "*.hpp" }, -- adjust as needed
         callback = function()
            local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
            for _, client in ipairs(clients) do
               if client.name == "clangd" and client.server_capabilities.documentFormattingProvider then
                  vim.lsp.buf.format({ async = false })
                  break
               end
            end
         end,
      })
   end,
}
