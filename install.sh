ln -sf $HOME/.dot_files/bashrc $HOME/.bashrc
ln -sf $HOME/.dot_files/vimrc $HOME/.vimrc
ln -sf $HOME/.dot_files/vim $HOME/.vim
ln -sf $HOME/.dot_files/gitignore $HOME/.gitignore
ln -sf $HOME/.dot_files/gitconfig $HOME/.gitconfig

for FILE in /home/vagrant/.dot_files/bash_completion/*
do
    NAME=$(basename $FILE)
    sudo ln -sf ${FILE} /etc/bash_completion.d/${NAME}
done

git submodule init
git submodule update
