# #!/bin/bash

# let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
# let secs=$((${upSeconds}%60))
# let mins=$((${upSeconds}/60%60))
# let hours=$((${upSeconds}/3600%24))
# let days=$((${upSeconds}/86400))
# UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# # get the load averages
# read one five fifteen rest < /proc/loadavg

# echo "$(tput setaf 2)
# `date +"%A, %e %B %Y, %r"`
# `uname -srmo`

# (here, some things may be manually updated: wlp2s0, /dev/sda1...)
#
# Uptime.............: ${UPTIME}
# Memory.............: `awk '/MemFree/ {printf( "%.2f\n", $2 / 1024 )}' /proc/meminfo` MB / `awk '/MemTotal/ {printf( "%.2f\n", $2 / 1024 )}' /proc/meminfo` MB
# Load Averages......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
# Running Processes..: `ps ax | wc -l | tr -d " "`
# IP Addresses.......: `ifconfig wlp2s0 | grep "inet" | awk '{ print $2 }' | head -n 1` and `wget -q -O - http://icanhazip.com/ | tail`
# Free Disk Space....: `df -Pkh | grep -E '^/dev/sda1' | awk '{ print $4 }' | awk -F '.' '{ print $1 }'` on /dev/sda1 (`df -Pkh | grep -E '^/dev/sda1' | awk '{ print $5 }'` used)
# $(tput sgr0)"

source ~/.bashrc
