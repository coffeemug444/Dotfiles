return {
   "ThePrimeagen/harpoon",
   config = function()
      local harpoon = require("harpoon")
      vim.keymap.set('n', '<leader>H', require('harpoon.mark').add_file, opts)
      vim.keymap.set('n', '<leader>hh', require("harpoon.ui").toggle_quick_menu, opts)
      for i = 1, 9 do
         vim.keymap.set('n', '<leader>h' .. i, function()
            require("harpoon.ui").nav_file(i)
         end, opts)
      end
   end
}
