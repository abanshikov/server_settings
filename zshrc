
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias office='libreoffice7.1'
alias my_ip='wget -qO- eth0.me'
alias uu='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y'
alias venv='virtualenv venv && source venv/bin/activate'
alias sv='source venv/bin/activate'
alias dv='deactivate'
alias bcopy='xclip -sel clip'
alias bpaste='xclip -sel clip -o'
# new line
prompt_end() {
    if [[ -n $CURRENT_BG ]]; then
        print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
    else
        print -n "%{%k%}"
    fi

    print -n "%{%f%}"
    CURRENT_BG=''

    #Adds the new line and ➜ as the start character.
    if [ "$EUID" -ne 0 ]; then
        printf "\n $"
    else
        printf "\n #"
    fi
}
# directory with programs
export PATH=$PATH:$HOME/bin
# default editor
export EDITOR=vim
