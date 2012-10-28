ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/bash_aliases $HOME/.bash_aliases
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/vim $HOME/.vim
ln -sf $PWD/gitignore $HOME/.gitignore
ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/tmux.conf $HOME/.tmux.conf

for FILE in $PWD/bash_completion/*
do
    NAME=$(basename $FILE)
    sudo ln -sf ${FILE} /opt/local/etc/bash_completion/${NAME}
done

git submodule init
git submodule update

. $HOME/.bashrc
