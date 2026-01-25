--=============================
-- Basic options
--=============================
local opt = vim.opt

opt.number = true
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

--=============================
-- Leader key
--=============================
vim.g.mapleader = " "

--=============================
-- Key mappings
--=============================
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>', opts)
map('n', '<leader>ke', ':edit ~/.config/kitty/kitty.conf<CR>', opts)
map('n', '<leader>ze', ':edit ~/.zshrc<CR>', opts)

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
}

local plugins = {}
for _, file in ipairs(plugin_files) do
  table.insert(plugins, require(file))
end

require("lazy").setup(plugins)

--=============================
-- Plugin-specific mappings
--=============================
map('n', '<leader>p', ':Telescope find_files<CR>', opts)
map('n', '<leader><BS>', ':Yazi<CR>', opts)
