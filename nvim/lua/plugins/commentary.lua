return {
   "tpope/vim-commentary",
   config = function()
      vim.keymap.set({'n', 'i'}, '<C-/>', function() vim.cmd('Commentary') end, opts)
   end
}

