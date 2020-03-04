#!/bin/bash

echo ".vimrc"
rm -f ~/.vimrc
ln -s `pwd`/vimrc ~/.vimrc

echo ".vim/ folder"
rm -rf ~/.vim
ln -s `pwd`/vim ~/.vim

echo ".profile"
rm -f ~/.profile
ln -s `pwd`/profile ~/.profile

echo ".git-completion.bash"
rm -f ~/.git-completion.bash
ln -s `pwd`/git-completion.bash ~/.git-completion.bash
