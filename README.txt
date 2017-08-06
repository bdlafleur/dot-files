This repository is an experiment in how to set up dot files so that I can get my
linux configuration and running on any machine quickly.

####################
# VIM Configurations
####################
sudo dnf install vim
sudo dnf install gvim
mkdir -p ~/.vim/autoload ~/.vim/bundle
sudo dnf install curl
curl ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogenvim
curl -LSso ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogen.vim
vim ~/.vimrc
  in the vimrc:
     execute pathogen#infect()
     syntax on
     filetype plugin indent on
cd ~/.vim/bundle
git clone http://github.com/scrooloose/nerdtree.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/bling/vim-airline
git clone https://github.com/flazz/vim-colorschemes.git
sudo dnf install ctags

##############################
# Packages that I've Installed
##############################
sudo dnf install conda
sudo dnf install fish
sudo dnf install fedora-upgrade
sudo dnf install gitk

######################
# Python Configuration
######################

# Jupyter things
pip install jupyter

# Packages I've downloaded
pip install yml
pip install docx
pip install ipython

# Installing update to fedora:
sudo fedora-upgrade
