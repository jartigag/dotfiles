#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 20/09/2019
#version: 0.2
#
# install my configuration files (dotfiles), just with symbolic links
# usage: bash install.sh

echo "let's install some dotfiles.."

# 1. get all dotfiles into an array:
# (adapting an example from http://mywiki.wooledge.org/BashGuide/Arrays)
#dotfiles=()
#while read -r -d $'\0'; do
#       dotfiles+=("$REPLY")
#done < <(find ./ -type f -name ".*")

dotfiles=($(find `pwd` -type f -name ".*"))

for i in ${!dotfiles[@]}
        #The keys are accessed using an exclamation point: ${!array[@]},
        #the values are accessed using ${array[@]}
do
                echo "cp ${dotfiles[$i]} $HOME"
                        cp ${dotfiles[$i]} $HOME
                done

                echo "done."
