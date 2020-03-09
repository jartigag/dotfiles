alias duh='du -h --max-depth=1 | sort -hr'
function gitcl() { git clone $1 && cd $(basename $_ .git); }
function gitcm() { git add .; git commit -m "$1"; git push origin master; }
alias open='xdg-open'
alias aptl='apt list --upgradable'
alias aptu='sudo apt upgrade'
alias t1='tree -L 1'
alias t2='tree -L 2'
alarm() {
    echo "alarm on $(date -d "$1")"
    sleep $(( $(date -d "$1" +%s) - $(date +%s) ))
    mplayer ~/alarms/beep-bop.mp3 > /dev/null 2>&1
}
md () {
    pandoc $1 | lynx -stdin
}
bk () {
    cp $1 $1.bak
}
