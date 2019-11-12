#source ~/.bash_vars # custom variables "logbook1" and "logbook2" are in this file ~/.bash_vars
alias duh='du -h --max-depth=1 | sort -hr'
function gitcl() { git clone $1 && cd $(basename $_ .git); }
function gitcm() { git add .; git commit -m "$1"; git push origin master; }
alias open='xdg-open'
alias aptl='apt list --upgradable'
alias aptu='sudo apt upgrade'
alias t1='tree -L 1'
alias t2='tree -L 2'
alarm() { sleep $(( $(date -d "$1" +%s) - $(date +%s) )); mplayer ~/alarms/beep-bop.mp3 > /dev/null 2>&1; }
lb() {
    echo -ne "\033]30;lb ✍️\007"
    vim ~/$logbook1/$(date '+%Y-%m-%d').md
}
md () {
    pandoc $1 | lynx -stdin
}
bk () {
    cp $1 $1.bak
}
mdy () {
    echo -ne "\033]30;mdt ⤺\007"
    pandoc ~/$logbook2/$(date -d 'yesterday' '+%Y-%m-%d').md | lynx -stdin
}
mdt () {
    echo -ne "\033]30;mdt 🗓\007"
    pandoc ~/$logbook2/$(date '+%Y-%m-%d').md | lynx -stdin
}
tmt () {
    echo -ne "\033]30;tmt ⏱\007"
    python3 ~/ttymetracker/ttymetracker.py ~/$logbook2 -m todo-list
}
tmtl () {
    echo -ne "\033]30;tmtl ⏱L\007"
    python3 ~/ttymetracker/ttymetracker.py ~/$logbook2 -l
}
tmta () {
    echo -ne "\033]30;tmta ⏱🡅\007"
    python3 ~/ttymetracker/ttymetracker.py ~/$logbook2 -m anuko -a ~/ttymetracker/ttymetracker_aliases.cfg
}
tmts () {
    echo -ne "\033]30;tmts ⏱🡅\007"
    python3 ~/ttymetracker/ttymetracker.py ~/$logbook2 -m sharepoint -a ~/ttymetracker/ttymetracker_aliases.cfg
}
tmtp () {
    python3 ~/ttymetracker/ttymetracker.py ~/$logbook2 --percent -a ~/ttymetracker/ttymetracker_aliases.cfg
}
alias mouse='sudo sh -c "echo -n \"exps\" > /sys/bus/serio/devices/serio2/protocol"' #https://slimbook.es/foro/question/2802-problema-touchpad-al-despertar-de-la-suspension
