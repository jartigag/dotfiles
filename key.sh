#!/bin/bash

#author: @jartigag
#date: 08/03/2021
#version: 0.1
#
# offline backup for sensitive data
#
#requirements: sudo apt install p7zip-full
#
#usage: ./key.sh [<dst_key.7z>]

dst=${1:-"/media/javi/jag32GB/key.7z"}
src=(".gnupg/" ".password-store/" ".ssh/" ".proxys")

cp $dst $dst.bak
rm $dst

mkdir -p /tmp/key/
for d in ${src[@]}
do
    cp -r $HOME/$d /tmp/key/${d//.}
    #              trim dots ^^^^^
done

cd /tmp/
7z a -mhe $dst key/* -p
rm -r key/
