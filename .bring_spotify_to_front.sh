#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 2019-04-29
#version: 0.3
#
# i associate 'alt+s' shortcut with this script,
# so it always brings spotify's window to front
# when i press it.

if [ ! -f /tmp/spotify-winID.wid ]; then
	spotify &&
	flagDone=`wmctrl -l | grep "Spotify" | cut -d " " -f1`
	while [ -z "$flagDone" ]
	do
		flagDone=`wmctrl -l | grep "Spotify" | cut -d " " -f1`
	done
	echo "$flagDone" > /tmp/spotify-winID.wid
else
	wmctrl -ia $(< /tmp/spotify-winID.wid)
fi
