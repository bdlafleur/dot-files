# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# added by Miniconda2 4.3.21 installer
export PATH="/home/blafleur/miniconda2/bin:$PATH"
export PATH="/home/scratch/blafleur/repos/mpact-projects/MpactTools/:$PATH"

# Added for mpact usage
export MODULEPATH="/home/scratch/blafleur/opt/mpact-dev-tools/env/:$MODULEPATH"

# Set default shell editor
export EDITOR='vim'

# Set path for openmc
export OPENMC_CROSS_SECTIONS="/home/blafleur/Repos/openmc/scripts/nndc_hdf5/cross_sections.xml"

# Set path for mpact
export MPACT_DATA="~/mpact/MPACT_Extras/xslibs/mpact51g_71_4.3m2_03262018.fmt"

export PYTHONPATH="/opt/openmc/v0.9.0/lib64/python2.7/site-packages/openmc-0.9.0-py2.7-linux-x86_64.egg"
export PYTHONPATH="/opt/dakota/6.8/share/dakota/python/:$PYTHONPATH"
export PYTHONPATH="/home/scratch/blafleur/repos/openmc-projects/ModelMaker:$PYTHONPATH"
export PYTHONPATH="/home/scratch/blafleur/repos/post-process/:$PYTHONPATH"
export PYTHONPATH="/home/scratch/blafleur/repos/mpact-projects/MpactTools/:$PYTHONPATH"

export PATH="/opt/openmc/v0.9.0/bin/:$PATH"
export PATH="/opt/dakota/6.8/bin/:/opt/dakota/6.8/share/dakota/test/:$PATH"

# Python path modifications

###########
# Aliases #
###########

alias update='source ~/.bashrc'
alias config='/usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME"'
alias l='ls -ltr'
alias tre='tree -shC -L 3'

# Pretty git log print in terminal
alias gl='git log --color --graph --pretty=format:'"'"'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"'"' --abbrev-commit'
alias cl='config log --color --graph --pretty=format:'"'"'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"'"' --abbrev-commit'

# Servers to connect with
alias ners-12='ssh 141.212.172.88'

###############
# tmux sessions
###############

work() {
    session="phd"
    tmux start-server
    tmux new-session -d -s $session

    # Split up all the panes.
    tmux splitw -h -p 85
    tmux splitw -v -p 10
    tmux select-pane -t 0
    tmux splitw -v -p 70

    # Startup each pane's purpose
    tmux select-pane -t 0
    tmux send-keys "htop" C-m

    tmux select-pane -t 1
    tmux send-keys "cd ~/Repos/$1" C-m
    tmux send-keys "ipython" C-m

    tmux select-pane -t 2
    tmux send-keys "cd ~/Repos/$1" C-m
    tmux send-keys "ls" C-m

    tmux select-pane -t 3
    tmux send-keys "cd ~/Repos/$1" C-m
    tmux send-keys "git status" C-m

    # Attach to session
    tmux attach -t $session
}

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# Add git completion scripts for bash branch info
source ~/.git-completion.bash
source ~/.git-prompt.sh

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

export PS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off'\$ "; \
fi)'

