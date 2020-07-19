# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# For running vera
if [ $HOSTNAME == "sawtooth1" ]; then
    source /projects/vera-cs-user/setenv.sh
    export PBS_EMAIL=blafleur@umich.edu
fi

#########################
# ENVIRONMENT VARIABLES #
#########################

# Set default shell editor
export EDITOR='vim'
export MPACT_DATA="~/mpact/MPACT_Extras/xslibs/mpact51g_71_4.3m2_03262018.fmt"
export OPENMC_CROSS_SECTIONS="/home/blafleur/Repos/openmc/scripts/nndc_hdf5/cross_sections.xml"
export PATH="/opt/openmc/v0.9.0/bin/:$PATH"
export PATH="/opt/dakota/6.8/bin/:/opt/dakota/6.8/share/dakota/test/:$PATH"

# For ners-am-07 mpact configs.
export MODULEPATH="/home/blafleur_local/opt/mpact-dev-tools/env/:$MODULEPATH"
export PATH="/home/blafleur_local/opt/cmake/cmake-3.17.0-Linux-x86_64/bin/:$PATH"
export PATH="/home/blafleur_local/opt/m4-1.4.17/bin/:$PATH"

###########
# Aliases #
###########

alias update='source ~/.bashrc'
alias config='/usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME"'
alias l='ls -ltr --color="auto"'
alias ls='ls -l --color="auto"'
alias tre='tree -shC -L 2'
alias ssh07='ssh 141.212.172.87'
alias ssh08='ssh 141.212.172.88'
alias ssh12='ssh 141.212.172.92'

# Pretty git log print in terminal
alias gl='git log --color --graph --pretty=format:'"'"'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"'"' --abbrev-commit'
alias cl='config log --color --graph --pretty=format:'"'"'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"'"' --abbrev-commit'

# store colors
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
PURPLE="\[\033[2;35m\]"
RED="\[\033[0;31m\]"
GREY='\[\033[2;37m\]'
WHITE='\[\033[1;37m\]'
YELLOW="\[\033[1;33m\]"

function color_my_prompt {
  local __env="$GREEN($CONDA_DEFAULT_ENV)"
  local __date_and_time="$PURPLE[\d - \T]"
  local __user_and_host="$GREY\u@\h"
  local __cur_location="$YELLOW\w"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$CYAN"
  local __prompt_tail="$CYAN\n->"
  local __user_input_color="$GREY"
  local __git_branch=$(__git_ps1);

  # colour branch name depending on state
  if [[ "${__git_branch}" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$RED"
  elif [[ "${__git_branch}" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$YELLOW"
  elif [[ "${__git_branch}" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$GREY"
  elif [[ "${__git_branch}" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$CYAN"
  fi

  # Build the PS1 (Prompt String)
  PS1="$__env $__date_and_time $__user_and_host $__cur_location$__git_branch_color$__git_branch $__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt

# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi

# Source git completion if exists.
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# Run mgitstatus and config status to see how all repos are doing.
function repostat {
    cd
    mgitstatus -f
    [[ -z $(config status -s) ]] || printf "Config directory: \033[1;31mDirty\033[0m\n"
    [[ -n $(config status -s) ]] || printf "Config directory: \033[1;32mOk\033[0m\n"
    cd - 2>&1 > /dev/null
}

# >>> conda initialize >>>
if [ "$HOSTNAME" = "DESKTOP-3N8OCFA" ]; then
    cd
    repostat

    __conda_setup="$('/home/blafleur/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/blafleur/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/blafleur/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/blafleur/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi

if [ "$HOSTNAME" = "ners-am-12" ]; then
    cd
    repostat
    export TERM=xterm-256color
    cd /home/scratch/blafleur

    __conda_setup="$('/home/blafleur_local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/blafleur_local/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/blafleur_local/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/blafleur_local/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi

