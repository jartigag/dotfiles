#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 2019-07-31
#version: 0.5
#
# i associate keyboard shortcuts with (this script + different arguments),
# so it brings desired windows to front when i press each one.
#
# usage: bash .bring_to_front.sh "Spotify" /tmp/spotify-winID.wid
#
# requeriments: sudo apt install wmctrl

windowTitle=$1
widFile=$2

if [ ! -f $widFile ]; then
        flagDone=`wmctrl -l | grep $windowTitle | cut -d " " -f1`
        while [ -z "$flagDone" ]
        do
                flagDone=`wmctrl -l | grep $windowTitle | cut -d " " -f1`
        done
        echo "$flagDone" > $widFile 
fi

wmctrl -ia $(< $widFile)
