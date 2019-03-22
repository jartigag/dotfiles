#!/bin/bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 22/03/2019
#version: 0.1

if [ ! -f /tmp/spotify-winID.wid ]; then
	wmctrl -l | grep "Spotify" | cut -d " " -f1 >> /tmp/spotify-winID.wid
	cat /tmp/spotify-winID.wid
else
	wmctrl -ia $(< /tmp/spotify-winID.wid)
fi
