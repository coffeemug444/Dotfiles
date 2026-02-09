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
      vim.keymap.set("n", 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", 'gt', vim.lsp.buf.type_definition, opts)
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
      vim.lsp.enable({ 'clangd', 'lua_ls' })
      vim.lsp.enable('bashls')

      vim.diagnostic.config({
         virtual_text = false, -- shows messages inline
         signs = false,        -- keeps W/E in the sign column
         underline = true,     -- underlines problematic code
         update_in_insert = false,
         severity_sort = true,
         float = true,
      })
   end,
}
