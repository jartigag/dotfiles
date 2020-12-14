#!/bin/bash

#author: @jartigag
#date: 29/10/2020
#version: 0.3
#
# minimals reminder:
# sudo apt install git vim curl
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "let's install some dotfiles.."

dotfiles=($(find `pwd` -type f -name ".*"))

for key in ${!dotfiles[@]}; do
    #TODO: from 'dotfiles/konsole/local-share-konsole-default dark.profile',
    #      move to '$HOME/.local/share/konsole/default dark.profile'
    echo "ln -f ${dotfiles[$key]} $HOME"
    ln -f ${dotfiles[$key]} $HOME
done

#TODO: ask for confirmation ([Y/n])

echo "done."
