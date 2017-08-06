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

alias hm='cd ~/'
alias update='source ~/.bashrc'
alias config='/usr/bin/git --git-dir=/home/blafleur/.cfg/ --work-tree=/home/blafleur
