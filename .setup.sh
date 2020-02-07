# Copy and paste to initialize Schenectady Labs.
# curl -Lk https://raw.githubusercontent.com/bdlafleur/dot-files/master/.setup.sh | /bin/bash 2>&1

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "                    Set Up Dot Files                     "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

# Clone dot files, and place them in the appropriate places.
git clone --bare https://github.com/bdlafleur/dot-files.git $HOME/.cfg
mkdir -p .config_backup
[ -f .bashrc ] && mv .bashrc .config_backup
[ -f .vimrc ] && mv .vimrc .config_backup
[ -f .tmux.conf ] && mv .tmux.conf .config_backup
[ -f .gitconfig ] && mv .gitconfig .config_backup
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@ checkout
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@ config status.showUntrackedFiles no

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "                 Configure Vim Pluggins                  "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim http://tpo.pe/pathogen.vim

git clone http://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree/
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar/
git clone https://github.com/bling/vim-airline ~/.vim/bundle/airline/
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/bundle/colorschemes/
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "              Clone Project Repositories                 "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

git clone https://github.com/bdlafleur/dakota-workspace ~/repos/dakota-workspace
git clone https://github.com/bdlafleur/forward-prop.git ~/repos/forward-prop
git clone https://github.com/bdlafleur/mpact-projects.git ~/repos/mpact-projects
git clone https://github.com/bdlafleur/neural-networking.git ~/repos/neural-networking
git clone https://github.com/bdlafleur/openmc-projects ~/repos/openmc-projects
git clone https://github.com/bdlafleur/post-process ~/repos/post-process
git clone https://github.com/bdlafleur/reduced-order-modeling.git ~/repos/reduced-order-modeling
git clone https://github.com/bdlafleur/statistical-inversion ~/repos/statistical-inversion
git clone https://github.com/bdlafleur/surrogate-modeling ~/repos/surrogate-modeling

# Other's repos worth having
git clone https://github.com/fboender/multi-git-status.git ~/repos/multi-git-status
cd ~/repos/multi-git-status
sudo ./install.sh
cd

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "                  Configure Anaconda                     "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

curl -O https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh

######################
# RClone Usage Guide #
######################

# rclone config (to configure and connect with gdrive)
# rclone lsd gdrive:Utilities (to list the directories inside the drive)
# rclone sync gdrive:Utilities ./Utilities -n (to sync ORDER MATTERS!!!!!!)
# rclone sync gdrive:Education/'UofM PhD'/Reports ./Education/'UofM PhD'/Reports
# rclone ls gdrive:Education/UofM\ Undergraduate\ 09-13/2012-2013\ Senior/Fall\ Semester/NERS\ 441/ ./Education/UofM\ Undergraduate\ 09-13/2012-2013\ Senior/Fall\ Semester/NERS\ 441/

##############
# Misc Notes #
##############

# List of required packages to install on new machine:
# ctags

# List of machines I know.
# ners-am-08: 141.212.172.88
# ners-am-12: 141.212.172.92

source ~/.bashrc
