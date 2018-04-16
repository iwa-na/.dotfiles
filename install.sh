#!/bin/bash

cd `dirname $0`
BASE=${PWD}

env | grep MSYSTEM_CHOST

if [ $? -eq 0 ]; then
    # win
    echo "win_mlink.batを管理者権限で実行する"
    read -p "実行し終わったら何かキーを押してください..."
else
    # linux/mac
    unlink ~/.vimrc
    unlink ~/.vim
    unlink ~/.screenrc

    ln -s ${BASE}/.vimrc ~/.vimrc
    ln -s ${BASE}/.vim ~/.vim
    ln -s ${BASE}/.screenrc ~/.screenrc
fi

#++++++++++++++++++++++++++++++
# .bashrc settings
grep "\.bashrc\.ext" ~/.bashrc
if [ $? -ne 0 ]; then
    echo >> ~/.bashrc
    echo ". ${BASE}/.bashrc.ext" >> ~/.bashrc
fi

#++++++++++++++++++++++++++++++
# vim plugin settings
cd ${BASE}/.vim/plugin

#gtags.vim
curl -O http://cvs.savannah.gnu.org/viewvc/*checkout*/global/global/gtags.vim

#im_control.vim
curl -O https://raw.githubusercontent.com/fuenor/im_control.vim/master/plugin/im_control.vim

#taglist.vim
curl -O https://raw.githubusercontent.com/vim-scripts/taglist.vim/master/plugin/taglist.vim

#++++++++++++++++++++++++++++++
# vim color settings
cd ${BASE}/.vim/colors

# hybrid
curl -O https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim

#++++++++++++++++++++++++++++++
# execute git clone
vim
