set number
set expandtab
set shiftwidth=3
set tabstop=3
set hidden
set termguicolors
colorscheme default
set list
set listchars=tab:▸\ ,trail:·
set scrolloff=8
set sidescrolloff=8
set clipboard=unnamedplus


let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>ke :edit ~/.config/kitty/kitty.conf<cr>
nmap <leader>ze :edit ~/.zshrc<cr>



"---------------------------------------
" Plugins
"---------------------------------------

" Automatically install vim--plug
let data_dir = '~/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/pluginsources/telescope.nvim   " Find files
source ~/.config/nvim/pluginsources/yazi.nvim        " File manager
source ~/.config/nvim/pluginsources/vim-code-dark    " vscode theme
source ~/.config/nvim/pluginsources/vim-fugitive     " git plugin
source ~/.config/nvim/pluginsources/nvim-lspconfig   " lsp 🙄

call plug#end()
doautocmd User PlugLoaded

" Plugin mappings

nmap <leader>p :Telescope find_files<cr>

nmap <leader><BS> :Yazi<cr>

