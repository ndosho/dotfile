export PATH=/bin:/usr/bin:/usr/local/bin:/home/linuxbrew/.linuxbrew/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

GUIX_PROFILE=$HOME/.config/guix/current
. "$GUIX_PROFILE/etc/profile"

export EDITOR="emacsclient -t -a ''"
export VISUAL="emacsclient -c -a ''"
export PAGER=bat

alias em="emacsclient -c -a ''"
alias nl="sudo nala"

setopt autocd
setopt extended_glob
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
HISTFILE=/home/ns/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


source ~/.config/zsh/plugins/zsh-substring-search/zsh-history-substring-search.zsh
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

man() {
  if command -v fzf > /dev/null 2>&1
  then
    local page=$(command man -k . | fzf --prompt='Man> ' | awk '{print $1}')
    if [[ -n $page ]]
    then 
      emacsclient -c -a "" +"Man $page | only"
    fi 
  else 
    emacsclient -c -a "" +"Man $1 | only"
  fi
}

function ff() {
  local selected_files
  selected_files=$(fzf -m --preview="bat --style=numbers --line-range :500 --color=always {}")
  if [[ -n $selected_files ]]; then 
    emacsclient -c -a "" $selected_files
  fi 
}

function pkill {
  ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
}


eval "$(starship init zsh)"
