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
    sudo ln -sf ${FILE} /etc/bash_completion.d/${NAME}
done

git submodule init
git submodule update

sudo pip install virtualenv virtualenvwrapper ipython

. $HOME/.bashrc
