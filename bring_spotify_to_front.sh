#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 03/04/2019
#version: 0.2
#
# i associate 'alt+s' shortcut with this script,
# so it always brings spotify's window to front
# when i press it.

if [ ! -f /tmp/spotify-winID.wid ]; then
	spotify &&
	wmctrl -l | grep "Spotify" | cut -d " " -f1 >> /tmp/spotify-winID.wid
	cat /tmp/spotify-winID.wid
else
	wmctrl -ia $(< /tmp/spotify-winID.wid)
fi
