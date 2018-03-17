# This repository is an experiment in how to set up dot files so that I can get my
# linux configuration up and running on any machine quickly.
#
# Run these commands first:
# Clone dot files, and place them in the appropriate places.
# git clone --bare https://github.com/bdlafleur/dot-files.git $HOME/.cfg
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@'
# config config --global user.email "blafleur@umich.edu"
# mkdir -p .config-backup
# mv .bashrc .config-backup
# mv .vimrc .config-backup
# mv .tmux.conf .config-backup
# config checkout
# config config status.showUntrackedFiles no
#
# Copy and paste into terminal the following to initialize setup.
# curl -Lk https://raw.githubusercontent.com/bdlafleur/dot-files/master/README.txt | /bin/bash


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
echo -e "response\ny" | sudo dnf install pylint
echo -e "response\ny" | sudo dnf install ImageMagick
echo -e "response\ny" | sudo dnf install python-yaml
echo -e "response\ny" | sudo dnf install gcc
echo -e "response\ny" | sudo dnf install chromium
echo -e "response\ny" | sudo dnf install conda

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
git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
git clone git://github.com/JuliaEditorSupport/julia-vim.git ~/.vim/bundle/julia-vim

######################
# Python Configuration
######################

sudo pip install --upgrade pip
sudo pip install jupyter
sudo pip install yml
sudo pip install tabulate
sudo pip install jupyterlab
sudo pip install numpy
sudo pip install scipy
sudo pip install matplotlib
sudo pip install pandas
sudo pip install pymc3

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

# 1) Download required packages for compliling/building
#      echo -e "response\ny" | sudo dnf install gcc-gfortran
#      echo -e "response\ny" | sudo dnf install gcc-c++
#      echo -e "response\ny" | sudo dnf install cmake
#      echo -e "response\ny" | sudo dnf install mpich
#      echo -e "response\ny" | sudo dnf install mpich-devel
#      echo -e "response\ny" | sudo dnf install libxml2-devel
#      echo -e "response\ny" | sudo dnf install libxslt-devel
#      sudo pip install h5py
#      sudo pip install Cython
#      sudo pip install pandas

# 2) Download and congigure HDF5
#    wget https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.20.tar.gz
#    gunzip < hdf5-1.8.20.tar.gz | tar xf -
#      (Do next two lines only if --enable-parallel, which doesn't work yet)
#         set -x FC /usr/lib64/mpich/bin/mpif90
#         set -x CC /usr/lib64/mpich/bin/mpicc
#    cd hdf5-1.8.20/
#    ./configure --prefix=/opt/hdf5/1.8.20 --enable-fortran --enable-fortran2003
#    make
#    make test
#    sudo make install
#    sudo make check-install

# 3) Clone openmc and compile code
#    git clone https://github.com/mit-crpg/openmc.git; cd openmc; git checkout v0.9.0; mkdir build
#    export HDF5_ROOT='/opt/hdf5/1.8.20'
#	   cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/opt/openmc/
#    export PYTHONPATH='/opt/openmc/lib64/python2.7/site-packages/openmc-0.9.0-py2.7-linux-x86_64.egg/'
#	   sudo make -j 8 -s -C build
#    ### Go into build/cmake_install.cmake and change PYTHONPATH env variable to lib64
#    sudo mkdir -p /opt/openmc/lib64/puthon2.7/site-packages/
#	   sudo make -s -C build install

# 4) Download Cross Sections and test the build
#    cd scripts; python openmc-get-nndc-data; cd ../
#    make test

# 5) Clone personal openmc repository
#    git clone https://github.com/bdlafleur/openmc-projects

######################################
######################################
######################################
#                                    #
#                                    #
# OpenFoam installation instructions #
#                                    #
#                                    #
######################################
######################################
######################################

##########################
# Installing / configuring

# sudo dnf update
# curl -fsSL https://get.docker.com/ | sh
# echo -e "response\ny" | sudo dnf install zypper
# sudo zypper -n in docker
# sudo systemctl start docker
# sudo systemctl enable docker
# sudo usermod -aG docker blafleur [[[ restart required after this step ]]]
# sudo sh -c "wget http://dl.openfoam.org/docker/openfoam5-linux -O /usr/bin/openfoam5-linux"
# sudo chmod 755 /usr/bin/openfoam5-linux

###########################
# Launching openfoam5-linux

# mkdir -p $HOME/OpenFOAM/${USER}-5.0
# cd $HOME/OpenFOAM/${USER}-5.0
# openfoam5-linux

#
# Testing openfoam5-linux

# mkdir -p $FOAM_RUN
# cd $FOAM_RUN
# cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .
# cd pitzDaily
# blockMesh
# simpleFoam
# paraFoam
