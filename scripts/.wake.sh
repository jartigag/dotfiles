#!/bin/bash
#author: @jartigag
#date: 2020-12-27
#version: 1.0
#
# it uses a Wake-on-LAN utility (`sudo apt install etherwake`)
# to turn a host on and login into it with ssh.
#
#usage: bash .wake.sh -m y0:ur:m4c:4d:dr:3s -i 192.168.1.10 -u myUserOnThatHost

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

echo "running etherwake to send magic packet (it needs sudo).."
sudo etherwake -i wlo1 $mac
echo "now $mac is waking.."

echo "waiting for $n_secs seconds.."
sleep $n_secs

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
