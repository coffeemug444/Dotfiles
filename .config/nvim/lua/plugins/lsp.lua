 -- These diagnostic keymaps are created unconditionally when Nvim starts:
 -- ]d jumps to the next diagnostic in the buffer
 -- [d jumps to the previous diagnostic in the buffer
 -- ]D jumps to the last diagnostic in the buffer
 -- [D jumps to the first diagnostic in the buffer
 -- <C-w>d shows diagnostic at cursor in a floating window

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
      vim.keymap.set("n", '<leader>gd', vim.lsp.buf.definition, opts)
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
         underline = true,
         update_in_insert = false,
         severity_sort = true,
         float = true,
         virtual_lines = {
            severity = { min = vim.diagnostic.severity.ERROR },
         },
         signs = {
            text = {
               [vim.diagnostic.severity.ERROR] = '',
               [vim.diagnostic.severity.WARN] = '',
            },
            numhl = {
               [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
               [vim.diagnostic.severity.WARN] = 'WarningMsg',
            },
         },
      })

      local format_on_write = function()
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
      end
      -- format_on_write()
   end,
}
