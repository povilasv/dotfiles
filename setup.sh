#!/bin/bash

sudo apt-get install stow neovim zsh tmux silversearcher-ag xsel

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.zshrc ~/.zsh
# ZFZ
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

sudo chsh -s /bin/zsh povilasv

nvim +PlugUpgrade +qall
nvim +PlugUpdate +qall

stow zsh
stow tmux
stow vim

exec zsh
