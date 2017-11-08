# This repository is an experiment in how to set up dot files so that I can get my
# linux configuration and running on any machine quickly.
#
# Run the following to initialize setup.
# sudo dnf install curl
# curl -Lk https://raw.githubusercontent.com/bdlafleur/dot-files/master/README.txt | /bin/bash

#########################################################################
# Automatically clone dot files, and place them in the appropriate places.

git clone --bare https://github.com/bdlafleur/dot-files.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@'
config config --global user.email "blafleur@umich.edu"
mkdir -p .config-backup
mv .bashrc .config-backup
mv .vimrc .config-backup
mv .tmux.conf .config-backup
config checkout
config config status.showUntrackedFiles no

#####################################
# Install Base Linux Packages via dnf
#####################################

echo -e "response\ny" | sudo dnf update
echo -e "response\ny" | sudo dnf install fish
echo -e "response\ny" | sudo dnf install fedora-upgrade
echo -e "response\ny" | sudo dnf install gitk
echo -e "response\ny" | sudo dnf install gvim
echo -e "response\ny" | sudo dnf install vim
echo -e "response\ny" | sudo dnf install python
echo -e "response\ny" | sudo dnf install redhat-rpm-config
echo -e "response\ny" | sudo dnf install python-devel
echo -e "response\ny" | sudo dnf install tmux
echo -e "response\ny" | sudo dnf install anki
echo -e "response\ny" | sudo dnf install keepass
echo -e "response\ny" | sudo dnf install meld
echo -e "response\ny" | sudo dnf install htop
echo -e "response\ny" | sudo dnf install sl

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
git clone https://github.com/christoomey/vim-tmux-navigator ~/.vim/bundle/vim-tmux-navigator/

######################
# Python Configuration
######################

sudo pip install --upgrade pip
sudo pip install jupyter
sudo pip install yml
sudo pip install tabulate

####################################
####################################
####################################
#                                  #
#                                  #
# OpenMC installation instructions #
#                                  #
#                                  #
####################################
####################################
####################################

# *Assuming I am in fish shell*

# 1) Download required packages for compliling/building
#      echo -e "response\ny" | sudo dnf install gcc-gfortran
#      echo -e "response\ny" | sudo dnf install gcc-c++
#      echo -e "response\ny" | sudo dnf install cmake
#      echo -e "response\ny" | sudo dnf install mpich
#      echo -e "response\ny" | sudo dnf install mpich-devel
#      sudo pip install h5py
#      sudo pip install Cython
#      sudo pip install pandas

# 2) Download and congigure HDF5
#    Go here: https://support.hdfgroup.org/HDF5/release/obtainsrc518.html#conf and download gzip file.
#    gunzip < hdf5-1.8.19.tar.gz | tar xf -
#      (Do next two lines only if --enable-parallel, which doesn't work yet)
#         set -x FC /usr/lib64/mpich/bin/mpif90
#         set -x CC /usr/lib64/mpich/bin/mpicc
#    ./configure --prefix=/opt/hdf5/1.8.19 --enable-fortran --enable-fortran2003
#    make
#    make test
#    sudo make install
#    sudo make check-install

# 3) Clone openmc and compile code
#    git clone https://github.com/mit-crpg/openmc.git; cd openmc; git checkout master
#    mkdir build; cd build
#    set -x HDF5_ROOT /opt/hdf5/1.8.19
#	mkdir -p build
#	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/opt/openmc
#	sudo make -s -C build
#    Go into build/cmake_install.cmake and change PYTHONPATH env variable to lib64
#	sudo make -s -C build install

# 4) Download Cross Sections and test the build
#    cd scripts; python openmc-get-nndc-data
#    make test

# 5) Clone personal openmc repository
#    git clone https://github.com/bdlafleur/openmc-projects
