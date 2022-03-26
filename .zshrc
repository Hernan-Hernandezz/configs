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

source $ZSH/oh-my-zsh.sh

#alias

alias estudio="cd /mnt/d/estudio"

alias alacrittyConfig="nvim /mnt/c/Users/andre/AppData/Roaming/alacritty/alacritty.yml"

alias la="ls -lah --color"

LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS

