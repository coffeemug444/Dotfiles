--=============================
-- Basic options
--=============================
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 3
opt.tabstop = 3
opt.hidden = true
opt.termguicolors = true
vim.cmd('colorscheme default')

opt.list = true
opt.listchars = { tab = "▸ ", trail = "·" }
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.colorcolumn = "105"

--=============================
-- Key mappings
--=============================

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- regular mappings

vim.keymap.set('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>', opts)
vim.keymap.set('n', '<leader>ke', ':edit ~/.config/kitty/kitty.conf<CR>', opts)
vim.keymap.set('n', '<leader>ze', ':edit ~/.zshrc<CR>', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('x', '<leader>p', '"_dP', opts)
vim.keymap.set('n', '<leader>cdh', ':cd %:h<CR>', opts)
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', opts)
vim.keymap.set({'i', 'n'}, '<M-Up>', function() vim.cmd('move .-2') end, opts)
vim.keymap.set({'i', 'n'}, '<M-Down>', function() vim.cmd('move .1') end, opts)
vim.keymap.set('n', '<leader>F', 'gg=G\'\'', opts)

vim.api.nvim_set_keymap("n", "<leader>cc", ":!cmake -S . -B build<CR>", opts) -- configure
vim.api.nvim_set_keymap("n", "<leader>cb", ":!cmake -S . -B build && cmake --build build<CR>", opts) -- build
vim.api.nvim_set_keymap("n", "<leader>cl", ":!cmake --build build --target clean<CR>", opts) -- clean
vim.api.nvim_set_keymap("n", "<leader>ct", ":!ctest --output-on-failure<CR>", opts) -- test
vim.api.nvim_create_autocmd("BufWritePost", {
   pattern = { "CMakeLists.txt", "sources.cmake" },
   callback = function()
      vim.cmd("!cmake -S . -B build &")
      print("CMake reconfigured")
   end,
})
vim.api.nvim_set_keymap("n", "<leader>cr", ":!cmake -S . -B build && cmake --build build && ./build/main<CR>", opts) -- build

--=============================
-- Plugins
--=============================

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

-- Add plugins
local plugin_files = {
   "plugins.telescope",
   "plugins.yazi",
   "plugins.vim-code-dark",
   "plugins.fugitive",
   "plugins.lsp",
   "plugins.blink",
   "plugins.vimbegood",
   "plugins.gitsigns",
   "plugins.fswitch",
   "plugins.harpoon",
   "plugins.endwise",
   "plugins.surround",
   "plugins.commentary",
   "plugins.friendly-snippets",
   -- "plugins.rainbow",
   "plugins.treesitter",
   "plugins.multicursor",
}

local plugins = {}
for _, file in ipairs(plugin_files) do
   table.insert(plugins, require(file))
end

require("lazy").setup(plugins)

