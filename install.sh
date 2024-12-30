#!/bin/bash

# author:  @jartigag
# date:    2024-12-30
# version: 0.4
#
# apt install git vim curl

dotfiles=($(find `pwd` -type f -name ".*"))

for key in ${!dotfiles[@]}; do
    echo "ln -f ${dotfiles[$key]} $HOME/"
    ln -f ${dotfiles[$key]} $HOME/
done
