export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="maran"

plugins=(git vi-mode zsh-autosuggestions zsh-completions kubectl)

bindkey -v

autoload -U compinit && compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh | sed 's/kubectl/k/g')
fi

if [ $commands[kubeadm] ]; then
    source <(kubeadm completion zsh)
fi


source $ZSH/oh-my-zsh.sh

_has() {
  return $( whence $1 >/dev/null )
}

_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($path $1);
  fi
}

# TODO
# eval `dircolors /home/povilasv/.dir_colors/dircolors`

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi

export SYSTEMD_EDITOR="/usr/bin/nvim"
export SYSTEMD_LESS=FRXMK
export LD_LIBRARY_PATH=/usr/local/lib:/lib/:/usr/lib
export TERMINAL=/usr/local/bin/alacritty

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey '^ ' autosuggest-accept # ctrl+space
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

export GOPATH=$HOME/gocode

_append_to_path $GOPATH/bin

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias gitcleanup='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# make git use neovim
export VISUAL=nvim
export EDITOR="$VISUAL"
#alias x='xclip -selection clipboard'
alias x='xsel --clipboard'

alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias klo='kubectl logs'

alias krm='kubectl delete'
alias krmf='kubectl delete -f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
