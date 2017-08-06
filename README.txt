# This repository is an experiment in how to set up dot files so that I can get my
# linux configuration and running on any machine quickly.
#
# Run the following to initialize setup.
# sudo dnf install curl
# curl -Lk https://raw.githubusercontent.com/bdlafleur/dot-files/master/README.txt

################################
# Install Linux packages via dnf
################################

sudo dnf install conda
sudo dnf install fish
sudo dnf install fedora-upgrade
sudo dnf install gitk
sudo dnf install gvim
sudo dnf install vim

#########################################################################
# Automatically clone dot files, and place them in the appropriate places.

git clone --bare https://github.com/bdlafleur/dot-files.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
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
curl ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogenvim
curl -LSso ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogen.vim

git clone http://github.com/scrooloose/nerdtree.git ~/.vim/bundle
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle
git clone https://github.com/bling/vim-airline ~/.vim/bundle
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle

######################
# Python Configuration
######################

pip install jupyter
pip install yml
pip install docx
pip install ipython
