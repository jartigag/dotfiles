#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 2019-05-10
#version: 0.4
#
# i associate keyboard shortcuts with (this script + different arguments),
# so it brings desired windows to front when i press each one.
#
# usage: bash bring_to_front.sh "Spotify" /tmp/spotify-winID.wid

windowTitle=$1
widFile=$2

if [ ! -f $widFile ]; then
	flagDone=`wmctrl -l | grep $windowTitle | cut -d " " -f1`
	while [ -z "$flagDone" ]
	do
		flagDone=`wmctrl -l | grep $windowTitle | cut -d " " -f1`
	done
	echo "$flagDone" > $widFile 
else
	wmctrl -ia $(< $widFile)
fi
