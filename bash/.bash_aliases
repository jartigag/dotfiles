alias aptl='apt list --upgradable'
alias aptu='sudo apt upgrade'
alias open='xdg-open'
alarm() {
    echo "alarm on $(date -d "$1")"
    sleep $(( $(date -d "$1" +%s) - $(date +%s) ))
    if [ $(dpkg-query -W -f='${Status}' mplayer 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
        sudo apt -y install mplayer
    fi
    mplayer ~/dotfiles/beep-bop.mp3 > /dev/null 2>&1
}
gitcl(){ git clone $1 && cd $(basename $_ .git);}
gitcm(){ git add -A;git commit -m"${1:.}";git push;}
