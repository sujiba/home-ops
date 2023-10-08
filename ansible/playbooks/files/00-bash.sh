# custom bash changes
# colorful bash
force_color_prompt=yes
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
# aliases
alias l='ls $LS_OPTIONS -la'
alias ll='ls $LS_OPTIONS -l'
alias vi='vim'
alias docker-compose='docker compose'
# search history with keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'