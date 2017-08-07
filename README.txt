# This repository is an experiment in how to set up dot files so that I can get my
# linux configuration and running on any machine quickly.
#
# Run the following to initialize setup.
# sudo dnf install curl
# curl -Lk https://raw.githubusercontent.com/bdlafleur/dot-files/master/README.txt | /bin/bash

################################
# Install Linux packages via dnf
################################

# sudo dnf install conda

echo -e "response\ny" | sudo dnf update
echo -e "response\ny" | sudo dnf install fish
echo -e "response\ny" | sudo dnf install fedora-upgrade
echo -e "response\ny" | sudo dnf install gitk
echo -e "response\ny" | sudo dnf install gvim
echo -e "response\ny" | sudo dnf install vim
echo -e "response\ny" | sudo dnf install python

#########################################################################
# Automatically clone dot files, and place them in the appropriate places.

git clone --bare https://github.com/bdlafleur/dot-files.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@'
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

###################
# VIM Configuration
###################

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogen.vim

git clone http://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree/
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar/
git clone https://github.com/bling/vim-airline ~/.vim/bundle/airline/
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes/

######################
# Python Configuration
######################

sudo pip --install upgrade
sudo pip install jupyter
sudo pip install yml
sudo pip install docx
