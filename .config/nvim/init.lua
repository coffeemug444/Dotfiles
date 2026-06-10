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
opt.winborder = "rounded"
opt.swapfile = false

--=============================
-- Key mappings
--=============================

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

local configure = "cmake -S . -B build"
local build = "cmake --build build -j$(nproc)"

vim.api.nvim_set_keymap("n", "<leader>cc", ":!" .. configure .. "<CR>", opts)                        -- configure
vim.api.nvim_set_keymap("n", "<leader>cb", ":!" .. configure .. " && " .. build .. "<CR>", opts) -- configure and build
vim.api.nvim_set_keymap("n", "<leader>cl", ":!cmake --build build --target clean<CR>", opts)         -- clean
vim.api.nvim_set_keymap("n", "<leader>ct", ":!ctest --output-on-failure<CR>", opts)                  -- test
vim.api.nvim_set_keymap("n", "<leader>cr", ":!" .. configure .. " && " .. build .. " && ./build/main<CR>", opts) -- configure build and run
-- autoreconfigure on saving cmake files
vim.api.nvim_create_autocmd("BufWritePost", {
   pattern = { "CMakeLists.txt", "sources.cmake" },
   callback = function()
      vim.cmd("!cmake -S . -B build &")
      print("CMake reconfigured")
   end,
})
-- compare file with unsaved
vim.api.nvim_create_user_command(
  "DiffOrig",
  "vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis | wincmd p",
  {}
)
vim.keymap.set('n', 'C', ":DiffOrig<CR>", opts)
vim.keymap.set('n', '<leader>w', ":w<CR>", opts)
vim.keymap.set('n', '<leader>q', ":q<CR>", opts)

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
   -- tpope
   "plugins.fugitive",
   "plugins.endwise",
   "plugins.surround",
   "plugins.commentary",
   "plugins.unimpaired",
   -- others
   "plugins.telescope",
   "plugins.yazi",
   "plugins.vim-code-dark",
   "plugins.lsp",
   "plugins.blink",
   "plugins.vimbegood",
   "plugins.gitsigns",
   "plugins.fswitch",
   "plugins.harpoon",
   "plugins.friendly-snippets",
   "plugins.treesitter",
   "plugins.multicursor",
   "plugins.dap",
   "plugins.scrollbar",
   "plugins.tmux",
}

local plugins = {}
for _, file in ipairs(plugin_files) do
   table.insert(plugins, require(file))
end

require("lazy").setup(plugins)

