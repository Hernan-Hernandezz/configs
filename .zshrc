ZSH_THEME="nanotech"

DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  extract
)

source ~/.oh-my-zsh/oh-my-zsh.sh

#alias

alias estudio="cd ~/Escritorio/estudio"

alias la="ls -la --color"
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS

eval "$(zoxide init zsh)"
