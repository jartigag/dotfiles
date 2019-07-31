#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 02/02/2019
#version: 0.1 
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
	        echo "ln -sf ${dotfiles[$i]} $HOME"
		        ln -sf ${dotfiles[$i]} $HOME
		done

		echo "done."
