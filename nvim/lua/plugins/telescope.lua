return {
   "nvim-telescope/telescope.nvim",
   dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons"
   },
   config = function()
      local telescope = require('telescope')
      telescope.setup{
         pickers = {
            find_files = {
               hidden = true,  -- show hidden files like dotfiles
            },
         },
      }
   end,
}
