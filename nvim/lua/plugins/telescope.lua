return {
   "nvim-telescope/telescope.nvim",
   dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons"
   },
   config = function()
      vim.keymap.set('n', '<C-f>', ':Telescope find_files<CR>', opts)
      vim.keymap.set('n', '<C-g>', ':Telescope live_grep<CR>', opts)
      local telescope = require('telescope')
      telescope.setup{
         pickers = {
            find_files = {
               hidden = true,  -- show hidden files like dotfiles
            },
         },
         extensions = {
            fzf = {}
         },
      }
   end,
}
