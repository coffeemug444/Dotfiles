# Ben's Dotfiles
These are my dotfiles. Managed by GNU stow.

# Usage
Make sure you have the following dependencies installed:
 * GNU stow
 * zsh
 * kitty
 * tmux
 * nvim
   * fd
   * ripgrep
   * yazi (and ya!)
   * lsp stuff (You'll need executables reachable from your PATH, so just put these in ~/.local/bin)
     * clangd
       * From the clang package, otherwise take a release from https://github.com/clangd/clangd
     * tree-sitter-cli
       * https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md"
     * lua-language-server
       * https://luals.github.io/#install
     * bash-language-server + shellcheck
       * Your package manager should have these

And if you're kind of freaky:
 * sway
 * waybar

oneline for arch:
`sudo pacman -S stow zsh rofi kitty nvim fd ripgrep cmake clang yazi tmux bash-language-server shellcheck shfmt sway waybar`
 > ⚠️ you'll still need to install tree-sitter-cli and lua-language-server yourself


If you're starting from a fresh install you'll need to do the following:
1. run `mkdir -p ~/.config/{kitty,nvim/lua/plugins,sway,tmux,waybar,yazi,zsh} ~/.local/bin ~/Templates`
2. Clone this repo to ~/.dotfiles
3. `cd` into it and run `stow .`
4. run `ya pkg add yazi-rs/plugins:smart-enter`
5. run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
