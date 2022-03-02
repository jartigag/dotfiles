#!/bin/bash
#author: @jartigag
#date: 2022-03-02
#version: 1.0
#
# Associate keyboard shortcuts with this script + different arguments,
# so it brings the desired window to front when a shortcut is pressed.
#
#usage:
# $ bash .bring_to_front.sh "Spotify" /tmp/spotify-winID.wid
#
#requeriments:
# $ sudo apt install wmctrl

windowTitle=$1
widFile=$2

if [ ! -f $widFile ]; then
        flagDone=`wmctrl -l | grep $windowTitle | cut -d " " -f1`
        while [ -z "$flagDone" ]
        do
                flagDone=`wmctrl -l | grep $windowTitle | cut -d " " -f1`
                sleep 1
        done
        echo "$flagDone" > $widFile
fi

wmctrl -ia $(< $widFile) || rm $widFile
