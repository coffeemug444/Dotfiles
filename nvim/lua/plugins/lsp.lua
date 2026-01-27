return {
   'neovim/nvim-lspconfig',
   config = function()
      vim.lsp.enable('clangd')

      vim.diagnostic.config({
          virtual_text = true,  -- shows messages inline
          signs = true,         -- keeps W/E in the sign column
          underline = true,     -- underlines problematic code
          update_in_insert = false,
          severity_sort = true,
      })
   end,
}
