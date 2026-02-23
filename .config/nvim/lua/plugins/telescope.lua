return {
   "nvim-telescope/telescope.nvim",
   dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-live-grep-args.nvim",
   },
   config = function()
      local telescope = require('telescope')
      vim.keymap.set('n', '<C-f>', require('telescope.builtin').find_files)
      vim.keymap.set('n', '<C-g>', telescope.extensions.live_grep_args.live_grep_args)
      vim.keymap.set('n', '<C-b>', require('telescope.builtin').buffers)
      telescope.setup{
         pickers = {
            find_files = {
               find_command = { 'fd' },
               hidden = true,  -- show hidden files like dotfiles
            },
         },
         extensions = {
            fzf = {}
         },
      }
   end,
}
