alias duh='du -h --max-depth=1'
alias gitlog='git log --graph --decorate --all'
function gitcl() { git clone $1 && cd $(basename $_ .git); }
function gitcm() { git add .; git commit -m "$1"; git push origin master; }
alias gitpl='git pull origin master'
alias gitrs='git reset --soft HEAD~1'
alias open='xdg-open'
alias gitst='git status'
alias gitdf='git diff'
function alarm() { sleep $(( $(date -d "$1" +%s) - $(date +%s) )); mplayer ~/alarms/beep-bop.mp3 > /dev/null 2>&1; }
function lb() {
	vim ~/logbook/$(date '+%Y-%m-%d').md
}
md () {
	pandoc $1 | lynx -stdin
}
bk () {
	cp $1 $1.bak
}
