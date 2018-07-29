#!/bin/sh

sudo pacman -Sy stow neovim zsh tmux the_silver_searcher xsel

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# ZFZ
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo chsh -s /bin/zsh povilasv

nvim +PlugUpgrade +qall
nvim +PlugUpdate +qall
