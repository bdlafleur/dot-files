# Copy and paste into terminal the following to initialize setup.
# curl -Lk https://raw.githubusercontent.com/bdlafleur/dot-files/master/README.txt | /bin/bash

###################
# Setup dot files #
###################
# Clone dot files, and place them in the appropriate places.
git clone --bare https://github.com/bdlafleur/dot-files.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@'
config config --global user.email "blafleur@umich.edu"
mkdir -p .config-backup
mv .bashrc .config-backup
mv .vimrc .config-backup
mv .tmux.conf .config-backup
config checkout
config config status.showUntrackedFiles no

# List of things to install on new machine.
# flake8

# List of machines I know.
# ners-am-08: 141.212.172.88
# ners-am-12: 141.212.172.92

####################
# Git Configurations
####################
curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

###################
# VIM Configuration
###################

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogen.vim

git clone http://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree/
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar/
git clone https://github.com/bling/vim-airline ~/.vim/bundle/airline/
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes/
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace

###########################
# Personal Git Repositories
###########################

git clone https://github.com/bdlafleur/openmc-projects ~/repos/openmc-projects
git clone https://github.com/bdlafleur/post-process ~/repos/post-process
git clone https://github.com/bdlafleur/statistical-inversion ~/repos/statistical-inversion
git clone https://github.com/bdlafleur/surrogate-modeling ~/repos/surrogate-modeling
git clone https://github.com/bdlafleur/dakota-workspace ~/repos/dakota-workspace
git clone https://github.com/bdlafleur/uq-course.git ~/repos/uq-course.git

# Other's repos worth having
git clone https://github.com/fboender/multi-git-status.git ~/repos/multi-git-status.git

######################
######################
######################
#
#
# RClone Usage Guide #
#
#
######################
######################
######################

# rclone config (to configure and connect with gdrive)
# rclone lsd gdrive:Utilities (to list the directories inside the drive)
# rclone sync gdrive:Utilities ./Utilities -n (to sync ORDER MATTERS!!!!!!)
# rclone sync gdrive:Education/'UofM PhD'/Reports ./Education/'UofM PhD'/Reports
# rclone ls gdrive:Education/UofM\ Undergraduate\ 09-13/2012-2013\ Senior/Fall\ Semester/NERS\ 441/ ./Education/UofM\ Undergraduate\ 09-13/2012-2013\ Senior/Fall\ Semester/NERS\ 441/
