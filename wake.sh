#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#author: @jartigag
#date: 2019-05-05
#version: 0.1
#
# it uses a Wake-on-LAN utility (`sudo apt install etherwake`)
# to turn a host and login into it with ssh.
#
#usage: bash wake.sh -m y0:ur:m4c:4d:dr:3s -i 192.168.1.10 -u myUserOnThatHost

n_secs=70
n_pings=10

while getopts m:i:u: opt #to make getopts expect an argument for an option,
do                       #place ':' after the proper option flag.
	case $opt in
		m)mac=$OPTARG;;
		i)ip=$OPTARG;;
		u)ssh_user=$OPTARG;;
	esac
done

echo "running.."
sudo etherwake -i eth0 $mac
echo "$mac is waking.."

echo "waiting for $mac for $n_secs seconds.."
sleep $n_secs/2
echo "(es de despertar perezoso, ya ves tú..😜)"
sleep $n_secs/2

echo "pinging to $ip $n_pings times.."

((count = $n_pings))          # Maximum number to try.
while [[ $count -ne 0 ]] ; do
    ping -c 1 $ip > /dev/null # Try once.
    resp=$?
    if [[ $resp -eq 0 ]] ; then
        ((count = 1))         # If okay, flag to exit loop.
    fi
    ((count = count - 1))     # So we don't go forever.

done
if [[ $resp -eq 0 ]] ; then   # Make final determination.
    echo "$ip is awake"
    if [[ -n $ssh_user ]]; then
	    ssh $ssh_user@$ip
    fi
else
    echo "timeout"
fi
