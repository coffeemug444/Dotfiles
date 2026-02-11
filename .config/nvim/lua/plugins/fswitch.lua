return {
   "derekwyatt/vim-fswitch",
   config = function()
      vim.keymap.set('n', '<M-o>', ':FSHere<CR>', opts)
   end
}
