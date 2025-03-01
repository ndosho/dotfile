export PATH=/bin:/usr/bin:/usr/local/bin:/home/linuxbrew/.linuxbrew/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export EDITOR="emacsclient -t -a ''"
export VISUAL="emacsclient -c -a ''"
export PAGER=bat

alias em="emacsclient -c -a ''"
alias nl="sudo nala"




eval "$(starship init zsh)"
