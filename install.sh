ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/vim $HOME/.vim
ln -sf $PWD/gitignore $HOME/.gitignore
ln -sf $PWD/gitconfig $HOME/.gitconfig

for FILE in $PWD/bash_completion/*
do
    NAME=$(basename $FILE)
    sudo ln -sf ${FILE} /etc/bash_completion.d/${NAME}
done

git submodule init
git submodule update


# Remove this - should be in puppet manifest but too lazy
ssh-keygen
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
sudo pip install virtualenv virtualenvwrapper
sudo npm install -g coffee-script less

. $HOME/.profile
