# aliases for known tools:
alias cat='bat --paging=never'
alias open='xdg-open'

# shortcuts:
alias duh='du -h --max-depth=1 | sort -hr'

function gitcl() { git clone $1 && cd $(basename $_ .git); }
function gitcm() { git add .; git commit -m "$1"; git push origin; }

alias aptl='apt list --upgradable'
alias aptu='sudo apt upgrade'

alias t1='tree -L 1'
alias t2='tree -L 2'

alias cdt='cd $(date +%Y-%m-%d)*' # cd today's dir
function mkdirt() { mkdir $(date +%Y-%m-%d)-$1; }

alarm() {
    echo "alarm on $(date -d "$1")"
    sleep $(( $(date -d "$1" +%s) - $(date +%s) ))
    if [ $(dpkg-query -W -f='${Status}' mplayer 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
        sudo apt -y install mplayer
    fi
    mplayer ~/dotfiles/beep-bop.mp3 > /dev/null 2>&1
}
