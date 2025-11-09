#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ===> aliases <====
alias ls='exa'
alias cd..='cd ..'
alias snooze='sudo systemctl suspend'
alias code='codium'
alias snake='python ~/Programming/projects/done/Snake/src/main.pyw'
alias calendar='calcurse'

# PATH setup
export PATH=$PATH:/sbin:/usr/local/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin:$HOME/.cargo/env
export PATH=$PATH:$HOME/.zig/
export PATH=$PATH:$HOME/.anaconda3/bin:
export PATH=$PATH:$HOME/.asdf/shims

export DISPLAY=:0.0

export EDITOR=vim
#vimlike commands
#set -o vi
#export EDITOR="vi"
#export VISUAL="vi"

# ===> prompt setup <====
PROMPT_COMMAND=build_prompt

build_prompt(){
    EXIT=$?
         
    #colors
    colbkg='\001\e[30m\002'
    col1='\001\e[31m\002'
    col2='\001\e[32m\002'
    col3='\001\e[33m\002'
    col4='\001\e[34m\002'
    col5='\001\e[35m\002'
    col6='\001\e[36m\002'
    colfore='\001\e[37m\002'
         
    colbkgb='\001\e[40m\002'
    col1b='\001\e[41m\002'
    col2b='\001\e[42m\002'
    col3b='\001\e[43m\002'
    col4b='\001\e[44m\002'
    col5b='\001\e[45m\002'
    col6b='\001\e[46m\002'
    colforeb='\001\e[47m\002'
         
    invert='\001\e[7m\002'
    bold='\001\e[1m\002'
    dim='\001\e[2m\002'
         
    reset='\001\e[0m\002'
         
    mod1t="$col1"
    mod1b="$col1b"
    mod2t="$col2"
    mod2b="$col2b"
    mod3t="$colbkg"
    mod3b="$colbkgb"
    okcolor="$col5"
    okcolorb="$col5b"
    notokcolor="$col4"
    notokcolorb="$col4b"
         
    separator=$'\[\xEE\x82\]\xB0'
         
    PS1=''

    #exit code module
    if [ $EXIT != 0 ]; then
        #not ok
        PS1+="${colbkg}${notokcolorb} ${EXIT} ${invert}${mod1t}${separator}${reset}"
    else
        #ok
        PS1+="${colbkg}${okcolorb} ${EXIT} ${invert}${mod1t}${separator}${reset}"
    fi
         
    #username module
    PS1+="${bold}${mod1b} \u ${mod1t}${mod2b}${separator}${reset}"
    #location module
    arrow2=$'\[\xEE\x82\]\xB1'
    home_symbol='~'
    loc=${PWD/${HOME}/${home_symbol}}
    locfin=${loc//\// ${arrow2} }
    PS1+="${mod2b}${bold} ${locfin} ${mod2t}${mod3b}${separator}"
    #'$' sign module
    #PS1+="${colfore}${colbkgb} \$"
    #reset
    PS1+="$reset "      
}

# ===> Fixes, integration & stuff I don't want to look at: <===

# wal colorscheme on multiple terminals
(cat ~/.cache/wal/sequences &)

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# backspace kitty ssh fix
[ "$TERM" = "xterm-kitty" ] && alias ssh='env TERM=xterm-256color ssh'

# dotnet :<
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# spotify theme :<
export PATH=$PATH:$HOME/.spicetify

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/kjpgx/.anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/kjpgx/.anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/kjpgx/.anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/kjpgx/.anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

[ -f "/home/kjpgx/.ghcup/env" ] && . "/home/kjpgx/.ghcup/env" # ghcup-env
