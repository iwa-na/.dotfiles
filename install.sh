#!/bin/bash

cd `dirname $0`
BASE=${PWD}

unlink ~/.vimrc
unlink ~/.vim
unlink ~/.screenrc

ln -s ${BASE}/.vimrc ~/.vimrc
ln -s ${BASE}/.vim ~/.vim
ln -s ${BASE}/.screenrc ~/.screenrc

#++++++++++++++++++++++++++++++
# .bashrc settings
grep "\.bashrc\.ext" ~/.bashrc
if [ $? -ne 0 ]; then
    echo ". ${BASE}/.bashrc.ext" >> ~/.bashrc
fi

#++++++++++++++++++++++++++++++
# vim plugin settings
cd ${BASE}/.vim/plugin
#alignta.vim
wget -nc https://raw.githubusercontent.com/h1mesuke/vim-alignta/master/plugin/alignta.vim

#gtags.vim
wget -nc http://cvs.savannah.gnu.org/viewvc/*checkout*/global/global/gtags.vim

#im_control.vim
wget -nc https://raw.githubusercontent.com/fuenor/im_control.vim/master/plugin/im_control.vim

#taglist.vim
wget -nc https://raw.githubusercontent.com/vim-scripts/taglist.vim/master/plugin/taglist.vim

#++++++++++++++++++++++++++++++
# vim color settings
cd ${BASE}/.vim/colors
# hybrid
wget -nc https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
