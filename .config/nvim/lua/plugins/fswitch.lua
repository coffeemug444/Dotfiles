return {
   -- This plugin allows you to switch between header/source files via alt-o
   "derekwyatt/vim-fswitch",
   config = function()
      vim.keymap.set('n', '<M-o>', ':FSHere<CR>', opts)
   end
}
