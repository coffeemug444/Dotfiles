return {
   "nvim-treesitter/nvim-treesitter",
   lazy = false,
   build = ':TSUpdate',

   config = function()
      local ts = require('nvim-treesitter')

      ts.setup{
         install_dir = vim.fn.stdpath('data') .. '/site'
      }

      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldlevel = 99 -- all folds fully expanded

      ts.install{ 'cpp' }

      vim.api.nvim_create_autocmd('FileType', {
         pattern = { 'cpp' },
         callback = function() vim.treesitter.start() end,
      })
   end
}
