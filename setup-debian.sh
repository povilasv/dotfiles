#!/bin/sh

sudo apt-get install stow vim zsh silversearcher-ag

# ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# ZFZ
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo chsh -s /bin/zsh povilasv

vim +PlugUpgrade +qall
vim +PlugUpdate +qall
